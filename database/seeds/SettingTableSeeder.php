<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            // currency and taxes
            ["key" => "currency_code", "value" => "USD"],
            ["key" => "currency_icon", "value" => "$"],
            ["key" => "tax_in_percent", "value" => "10"],

            // contact information
            ["key" => "support_email", "value" => "admin@example.com"],
            ["key" => "support_phone", "value" => "8181818118"],

            // delivery fee
            ["key" => "delivery_fee", "value" => "25"],
            ["key" => "delivery_fee_set_by", "value" => "admin"], // possible values admin, vendor, distance

            // distance base delivery fee
            // if delivery fee is of type distance, then this value will be used to calculate delivery fee for whole distance
            ["key" => "delivery_fee_per_km_base_charge", "value" => "5"], // base charge for initial kms
            ["key" => "delivery_fee_per_km_base_distance", "value" => "5"], // base distance till this distance base charge will apply
            ["key" => "delivery_fee_per_km_charge", "value" => "5"], // per km charges after initial distance

            ["key" => "delivery_distance", "value" => "8000"],
            ["key" => "distance_metric", "value" => "KM"],
            ["key" => "refer_amount", "value" => "50"],

            // meta
            ["key" => "privacy_policy", "value" => "Demo privacy policy"],
            ["key" => "about_us", "value" => "Demo privacy policy"],
            ["key" => "terms", "value" => "Demo Terms and Condition"],

            // commision
            ["key" => "admin_commision_value", "value" => "10"],

            ["key" => "schedule_interval_in_minutes", "value" => "30"],

            ["key" => "doctor_distance", "value" => "8000"]
        ]);
    }
}
