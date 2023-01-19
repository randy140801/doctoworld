<?php

namespace Vtlabs\Ecommerce\Http\Controllers\Api;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Vtlabs\Core\Models\User\User;
use Illuminate\Support\Facades\DB;
use Vtlabs\Ecommerce\Models\Order;
use Vtlabs\Core\Helpers\CoreHelper;
use Vtlabs\Ecommerce\Models\Vendor;
use Illuminate\Support\Facades\Auth;
use Vtlabs\Category\Models\Category;
use Vtlabs\Ecommerce\Models\Product;
use Vtlabs\Ecommerce\Filters\OrderFilter;
use Vtlabs\Ecommerce\Filters\VendorFilter;
use Vtlabs\Ecommerce\Models\VendorProduct;
use Vtlabs\Ecommerce\Models\FeedbackOption;
use Vtlabs\Ecommerce\Services\OrderService;
use Vtlabs\Core\Http\Controllers\Controller;
use Vtlabs\Ecommerce\Models\FeedbackQuestion;
use Vtlabs\Ecommerce\Http\Resources\VendorResource;
use Vtlabs\Ecommerce\Http\Resources\VendorRatingResource;
use Vtlabs\Ecommerce\Http\Resources\FeedbackOptionResource;
use Vtlabs\Ecommerce\Http\Resources\FeedbackQuestionResource;
use Rennokki\Plans\Models\PlanModel;

class VendorController extends Controller
{
    public function __construct()
    {
        if (array_key_exists('HTTP_AUTHORIZATION', $_SERVER)) {
            $this->middleware('auth:api');
        }
    }

    public function index(Request $request)
    {
        $request->validate([
            'category' => 'sometimes',
            'lat' => 'sometimes|numeric',
            'long' => 'sometimes|numeric',
            'search' => 'sometimes'
        ]);

        $vendors = Vendor::filter($request->all(), VendorFilter::class);

        $vendors = $vendors->with(['categories']);

        return VendorResource::collection($vendors->paginate());
    }

    public function show(Vendor $vendor, Request $request)
    {
        return new VendorResource($vendor);
    }

    public function showMyProfile(Request $request)
    {
        $vendor = Vendor::findByUser(Auth::user()->id);
        return new VendorResource($vendor);
    }

    public function update(Vendor $vendor, Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'tagline' => 'sometimes|string',
            'details' => 'sometimes|string',
            'meta' => 'sometimes|json',
            'minimum_order' => 'sometimes|numeric',
            'delivery_fee' => 'sometimes|numeric',
            'area' => 'sometimes|string',
            'address' => 'sometimes|string',
            'longitude' => 'sometimes|numeric|min:-180|max:180',
            'latitude' => 'sometimes|numeric|min:-90|max:90',
            'categories' => 'sometimes|array|exists:categories,id',
            'image_urls' => 'sometimes|array'
        ]);

        if ($request->meta) {
            request()->merge([
                "meta" => json_decode($request->meta)
            ]);
        }

        $vendor->fill($request->only([
            'meta', 'minimum_order', 'delivery_fee', 'area', 'address', 'longitude', 'latitude'
        ]));

        CoreHelper::fillTranslation($vendor, $request->only(['name', 'tagline', 'details']));

        $vendor->categories()->sync($request->categories);

        $vendor->save();

        // images
        if (!empty($request->image_urls)) {
            $newMediaItems = [];
            foreach ($request->image_urls as $imageUrl) {
                $newMediaItems[] = $vendor->addMediaFromUrl($imageUrl)->toMediaCollection("images");
            }
            $vendor->clearMediaCollectionExcept('images', $newMediaItems);
        }

        return new VendorResource($vendor->fresh());
    }

    public function insights(Vendor $vendor, Request $request)
    {
        $request->validate([
            'duration' => 'required|in:hours,days,months,years',
            'limit' => 'required|numeric'
        ]);

        $orders  = Order::whereHas('vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        });

        $orders = OrderService::summarize($orders, $request->duration, $request->limit);

        $summary = [
            'orders' => Order::filter(['vendor_id' => $vendor->id, 'duration' => $request->duration], OrderFilter::class)->count(),
            'revenue' => Order::filter(['vendor_id' => $vendor->id, 'duration' => $request->duration], OrderFilter::class)->sum('total'),
            'items_sold' => VendorProduct::salesCountSummary($vendor, $request->duration),
            'pending' => Order::filter(['vendor_id' => $vendor->id, 'duration' => $request->duration, 'active' => true], OrderFilter::class)->count(),
            'chart_data' => $orders->get(),
            'items_sold_chart' => VendorProduct::summarizeSalesCount($vendor, $request->duration, $request->limit)->get()
        ];

        return response()->json($summary);
    }

    public function ratingList(Vendor $vendor, Request $request)
    {
        return VendorRatingResource::collection($vendor->raters(User::class)->orderByDesc('pivot_created_at')->paginate());
    }

    public function ratingStore(Vendor $vendor, Request $request)
    {
        $request->validate([
            'rating' => 'required|numeric',
            'review' => 'required'
        ]);

        $user = Auth::user();

        // $user->unrate($vendor);
        $user->rate($vendor, $request->rating, $request->review);

        // update average rating of vendor for stats
        $vendor->average_ratings +=  $vendor->averageRating(User::class);
        $vendor->save();

        return response()->json([], 200);
    }

    public function ratingSummary(Vendor $vendor)
    {
        return response()->json([
            "average_rating" => $vendor->averageRating(User::class),
            "total_ratings" => $vendor->raters(User::class)->count(),
            "summary" => DB::table('ratings')->selectRaw('count(*) as total, ROUND(rating) as rounded_rating')
                ->where('rateable_type', Vendor::class)
                ->where('rateable_id', $vendor->id)
                ->where('rater_type', User::class)
                ->groupBy('rounded_rating')
                ->get()
        ]);
    }

    public function favourites(Request $request)
    {
        return VendorResource::collection(Auth::user()->favorite(Vendor::class)->flatten());
    }

    public function toggleFavourite(Vendor $vendor)
    {
        $vendor->toggleFavorite();

        return response()->json([]);
    }

    public function insightsOrderType(Vendor $vendor, Request $request)
    {
        $request->validate([
            'duration' => 'required|in:hours,days,months,years',
        ]);

        $createdAt = Carbon::now()->subDays(365 * 5);

        switch ($request->duration) {
            case 'hours':
                $createdAt = Carbon::now()->subDays(1);
                break;
            case 'days':
                $createdAt = Carbon::now()->subDays(7);
                break;
            case 'months':
                $createdAt = Carbon::now()->subDays(30);
                break;
            case 'years':
                $createdAt = Carbon::now()->subDays(365);
                break;
        }

        $orderTypesSummary = DB::table('ecommerce_orders')->selectRaw('count(*) as total, order_type')
            ->whereDate('created_at', '>', $createdAt)
            ->where('vendor_id', '=', $vendor->id)
            ->groupBy('order_type')
            ->get();

        return response()->json([
            "summary" => $orderTypesSummary
        ]);
    }

    public function insightsCategory(Vendor $vendor, Request $request)
    {
        $request->validate([
            'duration' => 'required|in:hours,days,months,years',
        ]);

        $createdAt = Carbon::now()->subDays(365 * 5);

        switch ($request->duration) {
            case 'hours':
                $createdAt = Carbon::now()->subDays(1);
                break;
            case 'days':
                $createdAt = Carbon::now()->subDays(7);
                break;
            case 'months':
                $createdAt = Carbon::now()->subDays(30);
                break;
            case 'years':
                $createdAt = Carbon::now()->subDays(365);
                break;
        }


        $categorySummary = DB::select("select category_id,sum(o.quantity) as total from ecommerce_order_products o join ecommerce_vendor_products vp on o.vendor_product_id=vp.id join ecommerce_products p on vp.product_id=p.id join ecommerce_product_categories c on p.id=c.product_id where DATE(o.created_at)>" . $createdAt->toDateString() . " and vp.vendor_id=" . $vendor->id . " group by category_id");

        foreach ($categorySummary as $summary) {
            $summary->category_id = Category::find($summary->category_id)->title;
        }

        return response()->json([
            "summary" => $categorySummary
        ]);
    }

    public function feedbackListQuestions(Vendor $vendor, Request $request)
    {
        return response()->json([
            'questions' =>  FeedbackQuestionResource::collection(FeedbackQuestion::where('vendor_id', $vendor->id)->get()),
            'options' =>  FeedbackOptionResource::collection(FeedbackOption::where('vendor_id', $vendor->id)->get())
        ]);
    }

    public function feedbackSaveQuestions(Vendor $vendor, Request $request)
    {
        $request->validate([
            'questions' => 'required|array',
            'questions.*.id' => 'sometimes',
            'questions.*.title' => 'required',
            'delete_all_questions' => 'sometimes',
            'options' => 'required|array',
            'options.*.rank' => 'required|numeric',
            'options.*.title' => 'required'
        ]);

        if (request()->has('delete_all_questions')) {
            // delete all previous questions before creating new onw
            FeedbackQuestion::where('vendor_id', $vendor->id)->delete();
        }

        foreach ($request['questions'] as $question) {
            if (isset($question['id'])) {
                // update
                $feedbackQuestion = FeedbackQuestion::find($question['id']);
            } else {
                // create
                $feedbackQuestion = new FeedbackQuestion();
            }

            $feedbackQuestion->vendor_id = $vendor->id;
            CoreHelper::fillTranslation($feedbackQuestion, ['title' => $question['title']]);

            $feedbackQuestion->save();
        }

        // handle feedback options
        FeedbackOption::where('vendor_id', $vendor->id)->delete();
        foreach ($request['options'] as $option) {
            $feedbackOption = new FeedbackOption();
            $feedbackOption->rank = $option['rank'];
            $feedbackOption->vendor_id = $vendor->id;
            CoreHelper::fillTranslation($feedbackOption, ['title' => $option['title']]);
            $feedbackOption->save();
        }

        return response()->json([
            'questions' =>  FeedbackQuestionResource::collection(FeedbackQuestion::where('vendor_id', $vendor->id)->get()),
            'options' =>  FeedbackOptionResource::collection(FeedbackOption::where('vendor_id', $vendor->id)->get())
        ]);
    }

    public function feedbackSubmitResult(Vendor $vendor, Request $request)
    {
        $request->validate([
            'questions' => 'required|array',
            'questions.*.id' => 'required',
            'questions.*.rank' => 'required'
        ]);

        foreach ($request['questions'] as $question) {
            DB::table('ecommerce_feedback_results')->insert([
                'feedback_question_id' => $question['id'],
                'rank' => $question['rank'],
                'vendor_id' => $vendor->id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);
        }

        return response()->json((object)[], 200);
    }

    public function feedbackInsights(Vendor $vendor, Request $request)
    {
        $request->validate([
            'duration' => 'required|in:hours,days,months,years',
        ]);

        $createdAt = Carbon::now()->subDays(365 * 5);

        switch ($request->duration) {
            case 'hours':
                $createdAt = Carbon::now()->subDays(1);
                break;
            case 'days':
                $createdAt = Carbon::now()->subDays(7);
                break;
            case 'months':
                $createdAt = Carbon::now()->subDays(30);
                break;
            case 'years':
                $createdAt = Carbon::now()->subDays(365);
                break;
        }

        $feedbackSummary = DB::select('select feedback_question_id,rank,count(*) as total from ecommerce_feedback_results where vendor_id=' . $vendor->id . ' and DATE(created_at)>' . $createdAt->toDateString() . ' group by feedback_question_id,rank order by feedback_question_id');

        foreach ($feedbackSummary as $summary) {
            $summary->feedback_question_title = FeedbackQuestion::find($summary->feedback_question_id)->title;
        }

        return response()->json([
            "summary" => $feedbackSummary
        ]);
    }
}
