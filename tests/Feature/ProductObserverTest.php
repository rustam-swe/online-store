<?php

namespace Tests\Feature;

use App\Models\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Tests\TestCase;

class ProductObserverTest extends TestCase
{
    use RefreshDatabase;

    public function telegram_message_is_sent_when_product_is_created()
    {
        // Arrange: Mock the HTTP response
        Http::fake([
            'https://api.telegram.org/*' => Http::response(['ok' => true], 200),
        ]);

        // Act: Create a new porduct
        $order = Product::factory()->create();

        // Assert: Check that the HTTP request was made
        Http::assertSent(function ($request) use ($order) {
            return $request->url() === 'https://api.telegram.org/bot7032512823:AAFmnkUO_PDRF3xpJU70BgeL6DLqtmRTdzc/sendMessage' &&
                   $request['chat_id'] === '262247413' &&
                   $request['text'] === "New order created: Order #{$order->id}";
        });
    }
}
