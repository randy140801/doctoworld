<?php

namespace Vtlabs\Payment\Http\Controllers\Api;

use Yabacon\Paystack;
use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Vtlabs\Payment\Models\Payment;
use Vtlabs\Core\Helpers\CoreHelper;
use Vtlabs\Payment\Models\PaymentMethod;
use Vtlabs\Payment\Events\OnWalletPayment;
use Vtlabs\Core\Http\Controllers\Controller;
use net\authorize\api\contract\v1 as AnetAPI;
use Vtlabs\Payment\Filters\PaymentMethodFilter;
use net\authorize\api\controller as AnetController;
use Vtlabs\Payment\Http\Resources\PaymentMethodResource;
use Vtlabs\Payment\Services\PaymentGateway\StripeGateway;

class PaymentController extends Controller
{
    public function paymentMethods(Request $request)
    {
        $paymentMethods = PaymentMethod::filter(array_merge(["enabled" => true], $request->all()), PaymentMethodFilter::class)->get();

        return PaymentMethodResource::collection($paymentMethods);
    }

    public function makeStripePayment(Payment $payment, Request $request)
    {
        $request->validate([
            'token' => 'required'
        ]);

        $settings = CoreHelper::settingsAsDictionary();
        $currency = isset($settings['currency_code']) ? strtolower($settings['currency_code']) : 'usd';

        $parameters = [
            'amount' => $payment->amount,
            'currency' => $currency,
            'token' => $request->token
        ];

        $stripeGateway = new StripeGateway();

        try {
            $stripeResponse = $stripeGateway->purchase($payment, $parameters);
            if ($stripeResponse->isSuccessfull()) {
                return response(["success" => true, "message" => "Payment succesfull"]);
            }
        } catch (\Exception $ex) {
            return response()->json(["success" => false, "message" => $ex->getMessage()], 400);
        }
    }

    public function makePayuPayment(Payment $payment, Request $request)
    {
        $request->validate([
            'result' => 'required|in:success,failed'
        ]);

        if ($request->result == 'success') {
            $payment->setStatus('paid');
            $payment->save();

            return response(["success" => true, "message" => "Payment succesfull"]);
        }

        if ($request->result == 'failed') {
            $payment->setStatus('failed');
            $payment->save();

            return response(["success" => false, "message" => "Payment failed"]);
        }
    }

    public function makePaystackPayment(Payment $payment, Request $request)
    {
        $paystack = new Paystack(env('PAYSTACK_SECURE_KEY'));
        try {
            $tranx = $paystack->transaction->initialize([
                'amount' => $payment->amount * 100,
                'email' => $payment->payer->email,         // unique to customers
                'reference' => (string)time(), // unique to transactions,
                'callback_url' => url('/api/payment/paystack/callback/' . $payment->payer->id . '?amount=' . $payment->amount)
            ]);
        } catch (\Yabacon\Paystack\Exception\ApiException $e) {
            die($e->getMessage());
        }

        // store transaction reference so we can query in case user never comes back
        // perhaps due to network issue
        // save_last_transaction_reference($tranx->data->reference);

        // redirect to page so User can pay
        header('Location: ' . $tranx->data->authorization_url);
    }


    public function paystackCallback(Payment $payment, Request $request)
    {
        $reference = isset($_GET['reference']) ? $_GET['reference'] : '';
        if (!$reference) {
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=error'));
        }

        // initiate the Library's Paystack Object
        $paystack = new Paystack(env('PAYSTACK_SECURE_KEY'));
        try {
            // verify using the library
            $tranx = $paystack->transaction->verify([
                'reference' => $reference, // unique to transactions
            ]);
        } catch (\Yabacon\Paystack\Exception\ApiException $e) {
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=error'));
        }

        if ('success' === $tranx->data->status) {
            $payment->setStatus('paid');
            $payment->save();
            header('Location: ' . url('/api/payment/paystack/status/' . $payment->id . '?result=success'));
        }
    }

    public function paystackStatus(Request $request)
    {
        echo $request->result;
    }

    public function makeWalletPayment(Payment $payment, Request $request)
    {
        $user = User::find($payment->payer_id);

        if ($user->canWithdraw($payment->amount)) {
            $payment->setStatus('paid');
            $payment->save();

            // withdraw from wallet is responsibility of listerner because we want to attach the payble_type object in
            // transaction meta
            event(new OnWalletPayment($payment->fresh()));

            return response(["success" => true, "message" => "Payment succesfull"]);
        }

        $payment->setStatus('failed');
        $payment->save();

        return response(["success" => false, "message" => "Insufficient balance in wallet"], 400);
    }

    public function makeAuthorizeNetPayment(Payment $payment, Request $request)
    {
        $request->validate([
            'name' => 'required',
            'card_number' => 'required',
            'exp_month' => 'required',
            'exp_year' => 'required',
            'cvv' => 'required'
        ]);

        $input = $request->input();
        $errorMessage = 'There were some issue with the payment. Please try again later.';

        /* Create a merchantAuthenticationType object with authentication details
          retrieved from the constants file */
        $merchantAuthentication = new AnetAPI\MerchantAuthenticationType();
        $merchantAuthentication->setName(env('ANET_MERCHANT_LOGIN_ID'));
        $merchantAuthentication->setTransactionKey(env('ANET_MERCHANT_TRANSACTION_KEY'));

        // Set the transaction's refId
        $refId = 'ref-' . $payment->id . '-' . time();
        $cardNumber = preg_replace('/\s+/', '', $input['card_number']);

        // Create the payment data for a credit card
        $creditCard = new AnetAPI\CreditCardType();
        $creditCard->setCardNumber($cardNumber);
        $creditCard->setExpirationDate($input['exp_year'] . "-" . $input['exp_month']);
        $creditCard->setCardCode($input['cvv']);

        // Add the payment data to a paymentType object
        $paymentOne = new AnetAPI\PaymentType();
        $paymentOne->setCreditCard($creditCard);

        // Create a TransactionRequestType object and add the previous objects to it
        $transactionRequestType = new AnetAPI\TransactionRequestType();
        $transactionRequestType->setTransactionType("authCaptureTransaction");
        $transactionRequestType->setAmount($payment->amount);
        $transactionRequestType->setPayment($paymentOne);

        // Assemble the complete transaction request
        $requests = new AnetAPI\CreateTransactionRequest();
        $requests->setMerchantAuthentication($merchantAuthentication);
        $requests->setRefId($refId);
        $requests->setTransactionRequest($transactionRequestType);

        // Create the controller and get the response
        $controller = new AnetController\CreateTransactionController($requests);
        $response = $controller->executeWithApiResponse(\net\authorize\api\constants\ANetEnvironment::SANDBOX);

        if ($response != null) {
            // Check to see if the API request was successfully received and acted upon
            if ($response->getMessages()->getResultCode() == "Ok") {
                // Since the API request was successful, look for a transaction response
                // and parse it to display the results of authorizing the card
                $tresponse = $response->getTransactionResponse();

                if ($tresponse != null && $tresponse->getMessages() != null) {
                    $payment->setStatus('paid');
                    $payment->save();

                    return response(["success" => true, "message" => "Payment succesfull"]);
                } else {
                    if ($tresponse->getErrors() != null) {
                        $errorMessage = $tresponse->getErrors()[0]->getErrorText();
                    }
                }
            } else {
                $tresponse = $response->getTransactionResponse();

                if ($tresponse != null && $tresponse->getErrors() != null) {
                    $errorMessage = $tresponse->getErrors()[0]->getErrorText();
                } else {
                    $errorMessage = $response->getMessages()->getMessage()[0]->getText();
                }
            }
        } else {
            $errorMessage = "No response returned";
        }

        $payment->setStatus('failed');
        $payment->save();

        return response(["success" => false, "message" => $errorMessage]);
    }

    // bambora payment gateway
    public function makeBamboraPayment(Payment $payment, Request $request)
    {
        $request->validate([
            'name' => 'required',
            'card_number' => 'required',
            'exp_month' => 'required',
            'exp_year' => 'required',
            'cvv' => 'required'
        ]);

        $merchant_id = env('BAMBORA_MERCHANT_ID'); //INSERT MERCHANT ID (must be a 9 digit string)
        $api_key = env('BAMBORA_API_KEY'); //INSERT API ACCESS PASSCODE
        $api_version = 'v1'; //default
        $platform = 'api'; //default

        //Create Beanstream Gateway
        $beanstream = new \Beanstream\Gateway($merchant_id, $api_key, $platform, $api_version);

        //Example Card Payment Data
        $payment_data = array(
            'order_number' => $payment->id,
            'amount' => $payment->amount,
            'payment_method' => 'card',
            'card' => array(
                'name' => $request->name,
                'number' => $request->card_number,
                'expiry_month' => $request->card_number,
                'expiry_year' => $request->card_number,
                'cvd' => $request->cvv,
            )
        );
        $complete = TRUE; //set to FALSE for PA

        //Try to submit a Card Payment
        try {

            $result = $beanstream->payments()->makeCardPayment($payment_data, $complete);

            /*
            * Handle successful transaction, payment method returns
            * transaction details as result, so $result contains that data
            * in the form of associative array.
            */
            $payment->setStatus('paid');
            $payment->save();

            return response(["success" => true, "message" => "Payment succesfull"]);
        } catch (\Beanstream\Exception $e) {
            /*
            * Handle transaction error, $e->code can be checked for a
            * specific error, e.g. 211 corresponds to transaction being
            * DECLINED, 314 - to missing or invalid payment information
            * etc.
            */

            $payment->setStatus('failed');
            $payment->save();

            return response(["success" => false, "message" => $e->getMessage()]);
        }
    }

    // telebirr payment gateway


    private function telebirrEncryptRSA($data, $public)
    {
        $pubPem = chunk_split($public, 64, "\n");
        $pubPem = "-----BEGIN PUBLIC KEY-----\n" . $pubPem . "-----END PUBLIC KEY-----\n";
        $public_key = openssl_pkey_get_public($pubPem);
        if (!$public_key) {
            die('invalid public key');
        }
        $crypto = '';
        foreach (str_split($data, 117) as $chunk) {
            $return = openssl_public_encrypt($chunk, $cryptoItem, $public_key);
            if (!$return) {
                return ('fail');
            }
            $crypto .= $cryptoItem;
        }
        $ussd = base64_encode($crypto);
        return $ussd;
    }

    public function makeTelebirrPayment(Payment $payment, Request $request)
    {
        $appKey = env('TELEBIRR_APP_KEY');
        $appId = env('TELEBIRR_APP_ID');

        $data = [
            'outTradeNo' => $payment->id . '-' . uniqid("", true),
            'subject' => 'Payment for pay id #' . $payment->id,
            'totalAmount' => $payment->amount,
            'shortCode' => env('TELEBIRR_SHORT_CODE'),
            'notifyUrl' => url('/api/payment/telebirr/callback/' . $payment->id),
            'returnUrl' => url('/api/payment/telebirr/callback/' . $payment->id),
            'receiveName' => env('TELEBIRR_RECEIVER_NAME'),
            'appId' => $appId,
            'timeoutExpress' => '30',
            'nonce' => uniqid("", true),
            'timestamp' => strval(time() * 1000)
        ];

        $data['appKey'] = $appKey;

        ksort($data);
        $StringA = '';
        foreach ($data as $k => $v) {
            if ($StringA == '') {
                $StringA = $k . '=' . $v;
            } else {
                $StringA = $StringA . '&' . $k . '=' . $v;
            }
        }

        $StringB = hash("sha256", $StringA);


        $sign = strtoupper($StringB);

        $ussdjson = json_encode($data);

        $publicKey = env('TELEBIRR_PUBLIC_KEY');
        $ussd = $this->telebirrEncryptRSA($ussdjson, $publicKey);
        $requestMessage = [
            'appid' => $appId,
            'sign' => $sign,
            'ussd' => $ussd
        ];

        $api = 'http://196.188.120.3:10443/service-openup/toTradeWebPay';

        // Create a new cURL resource
        $ch = curl_init($api);

        $payload = json_encode($requestMessage);

        // Attach encoded JSON string to the POST fields
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

        // Set the content type to application/json
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));

        // Return response instead of outputting
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Execute the POST request
        $result = curl_exec($ch);

        // sample response 
        // {"code":200,"data":{"toPayUrl":"http://196.188.120.3:11443/ammwebpay/#/?transactionNo=202112071640201468213792884588545"},"message":"Operation successful","dateTime":1638884420976,"path":null,"errorDetails":{},"extraData":{}}

        if (curl_errno($ch)) {
            return response(["message" => curl_error($ch)], 400);
        } else {
            // check the HTTP status code of the request
            $resultStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if ($resultStatus != 200) {
                return response(["message" => 'Request failed: HTTP status code: ' . $resultStatus], 400);
            }
            $response = json_decode($result, true);

            if($response['code'] !== 200) {
                return response(["message" => $response['message']], 400);
            }
            echo $response['data']['toPayUrl'];
            dd();
            header('location:' . $response['data']['toPayUrl']);
        }

        // Close cURL resource
        curl_close($ch);
    }

    public function telebirrCallback(Payment $payment, Request $request)
    {
        $responseCode = $request->code;
        $msg = $request->msg;

        if ($msg == 'success') {

            $payment->setStatus('paid');
            $payment->save();
            header('Location: ' . url('/api/payment/telebirr/status/' . $payment->id . '?result=success'));
        } else {

            $payment->setStatus('failed');
            $payment->save();
            header('Location: ' . url('/api/payment/telebirr/status/' . $payment->id . '?result=error'));
        }
    }

    public function telebirrStatus(Request $request)
    {
        echo $request->result;
    }
}
