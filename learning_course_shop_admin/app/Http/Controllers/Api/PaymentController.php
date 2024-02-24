<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Stripe\Checkout\Session;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function checkout(Request $request)
    {
        try {
            $courseId = $request->courseId;
            $user = $request->user();
            $token = $user->token;

            Stripe::setApiKey('sk_test_51OhUsAESxQYGv7yMYBURmA9Jehs04bKIGaBPiDIWfjSUeVhPlcVWbofK5Pz2kCcCIeGFt7alXilMgbjhp0xfMGxn002L6OzbnX');

            $getCourse = Course::where('id', '=', $courseId)->first();

            if (empty($getCourse)) {
                return response()->json([
                    'status' => true,
                    'message' => 'Course not found',
                    'data' => null,
                ], 200);
            }

            $orderMap = [];
            $orderMap['course_id'] = $courseId;
            $orderMap['user_token'] = $token;
            /*
            status = 1 means successful order
            */
            $orderMap['status'] = 1;

            $orderResult = Order::where($orderMap)->first();

            /*
            if we fall in the below condition, it means we already have an order from the same user with the same token
            same course id
            */
            if (!empty($orderResult)) {
                return response()->json(
                    [
                        'status' => true,
                        'message' => 'The order already exist',
                        'data' => null,
                    ],
                    200
                );
            }

            $domain = env('APP_URL');

            $map = [];
            $map['user_token'] = $token;
            $map['course_id'] = $courseId;
            $map['total_amount'] = $getCourse->price;
            $map['status'] = 0;
            $map['created_at'] = Carbon::now()->timezone('Asia/Kuala_Lumpur');

            $orderNumber = Order::insertGetId($map);

            $checkoutSession = Session::create([
                'line_items' => [[
                    'price_data' => [
                        'currency' => 'MYR',
                        'product_data' => [
                            'name' => $getCourse->name,
                            'description' => $getCourse->description,
                        ],
                        'unit_amount' => intval(($getCourse->price) * 100)
                    ], 'quantity' => 1,
                ]],
                'payment_intent_data' => [
                    'metadata' => ['order_num' => $orderNumber, 'user_token' => $token],
                ],
                'metadata' => [
                    'order_num' => $orderNumber,
                    'user_token' => $token
                ],
                'mode' => 'payment',
                'success_url' => $domain . 'success',
                'cancel_url' => $domain . 'cancel'
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Order has been placed',
                'data' => $checkoutSession->url,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function webGoHooks()
    {


        // The library needs to be configured with your account's secret key.
        // Ensure the key is kept out of any version control system you might be using.
        $stripe = new \Stripe\StripeClient('sk_test_51OhUsAESxQYGv7yMYBURmA9Jehs04bKIGaBPiDIWfjSUeVhPlcVWbofK5Pz2kCcCIeGFt7alXilMgbjhp0xfMGxn002L6OzbnX');

        // This is your Stripe CLI webhook secret for testing your endpoint locally.
        $endpoint_secret = 'whsec_682NymPM4x2W8sYzP2WgCc5tSclJedvj';

        $payload = @file_get_contents('php://input');
        $sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
        $event = null;

        try {
            $event = \Stripe\Webhook::constructEvent(
                $payload,
                $sig_header,
                $endpoint_secret
            );
        } catch (\UnexpectedValueException $e) {
            // Invalid payload
            http_response_code(400);
            exit();
        } catch (\Stripe\Exception\SignatureVerificationException $e) {
            // Invalid signature
            http_response_code(400);
            exit();
        }

        // Handle the event
        switch ($event->type) {
            case 'account.updated':
                $account = $event->data->object;
            case 'account.external_account.created':
                $externalAccount = $event->data->object;
            case 'account.external_account.deleted':
                $externalAccount = $event->data->object;
            case 'account.external_account.updated':
                $externalAccount = $event->data->object;
            case 'balance.available':
                $balance = $event->data->object;
            case 'billing_portal.configuration.created':
                $configuration = $event->data->object;
            case 'billing_portal.configuration.updated':
                $configuration = $event->data->object;
            case 'billing_portal.session.created':
                $session = $event->data->object;
            case 'capability.updated':
                $capability = $event->data->object;
            case 'cash_balance.funds_available':
                $cashBalance = $event->data->object;
            case 'charge.captured':
                $charge = $event->data->object;
            case 'charge.expired':
                $charge = $event->data->object;
            case 'charge.failed':
                $charge = $event->data->object;
            case 'charge.pending':
                $charge = $event->data->object;
            case 'charge.refunded':
                $charge = $event->data->object;
            case 'charge.succeeded': {
                    $charge = $event->data->object;
                    if ($event->type == "charge.succeeded") {
                        $session = $event->data->object;
                        $metadata = $session["metadata"];
                        $orderNum = $metadata->order_num;
                        $userToken = $metadata->user_token;
                        Log::info('order id' . $orderNum);
                        $map = [];
                        $map['status'] = 1;
                        $map['updated_at'] = Carbon::now()->timezone('Asia/Kuala_Lumpur');
                        $whereMap = [];
                        $whereMap['user_token'] = $userToken;
                        $whereMap['id'] = $orderNum;
                        Order::where($whereMap)->update($map);
                    }
                }

            case 'charge.updated':
                $charge = $event->data->object;
            case 'charge.dispute.closed':
                $dispute = $event->data->object;
            case 'charge.dispute.created':
                $dispute = $event->data->object;
            case 'charge.dispute.funds_reinstated':
                $dispute = $event->data->object;
            case 'charge.dispute.funds_withdrawn':
                $dispute = $event->data->object;
            case 'charge.dispute.updated':
                $dispute = $event->data->object;
            case 'charge.refund.updated':
                $refund = $event->data->object;
            case 'checkout.session.async_payment_failed':
                $session = $event->data->object;
            case 'checkout.session.async_payment_succeeded':
                $session = $event->data->object;
            case 'checkout.session.completed':
                $session = $event->data->object;
            case 'checkout.session.expired':
                $session = $event->data->object;
            case 'credit_note.created':
                $creditNote = $event->data->object;
            case 'credit_note.updated':
                $creditNote = $event->data->object;
            case 'credit_note.voided':
                $creditNote = $event->data->object;
            case 'payment_method.attached':
                $paymentMethod = $event->data->object;
            case 'payment_method.automatically_updated':
                $paymentMethod = $event->data->object;
            case 'payment_method.detached':
                $paymentMethod = $event->data->object;
            case 'payment_method.updated':
                $paymentMethod = $event->data->object;
            case 'price.created':
                $price = $event->data->object;
            case 'price.deleted':
                $price = $event->data->object;
            case 'price.updated':
                $price = $event->data->object;
            case 'product.created':
                $product = $event->data->object;
            case 'product.deleted':
                $product = $event->data->object;
            case 'product.updated':
                $product = $event->data->object;
                // ... handle other event types
            default:
                echo 'Received unknown event type ' . $event->type;
        }

        http_response_code(200);
    }
}
