<?php

namespace App\Observers;

use App\Models\Product;
use Illuminate\Support\Facades\Http;

class ProductObserver
{
    /**
     * Handle the Product "created" event.
     */
    public function created(Product $product): void
    {
        $url = "https://api.telegram.org/bot7032512823:AAFmnkUO_PDRF3xpJU70BgeL6DLqtmRTdzc/sendMessage";
        Http::post($url, [
            "chat_id" => "262247413",
            "text"    => $product
        ]);
    }

    /**
     * Handle the Product "updated" event.
     */
    public function updated(Product $product): void
    {
        //
    }

    /**
     * Handle the Product "deleted" event.
     */
    public function deleted(Product $product): void
    {
        //
    }

    /**
     * Handle the Product "restored" event.
     */
    public function restored(Product $product): void
    {
        //
    }

    /**
     * Handle the Product "force deleted" event.
     */
    public function forceDeleted(Product $product): void
    {
        //
    }
}
