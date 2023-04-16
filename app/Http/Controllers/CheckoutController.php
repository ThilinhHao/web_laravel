<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Product;
use App\Models\Category;
use App\Models\Wishlist;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends Controller
{
    //
    public function index()
    {
        $categoryAll = Category::all();

        $cart = Cart::where('user_id', Auth::id())->get();
        $countCart = $cart->count();

        $wishlist = Wishlist::where('user_id', Auth::id())->get();
        $countWish = $wishlist->count();

        $oldCartItems = Cart::where('user_id', Auth::id())->get();
        if ($oldCartItems->count() == 0) {
            return redirect()->route('cart')->with('success', 'Your cart is empty.');
        }
        foreach ($oldCartItems as $item) {
            $product = Product::find($item->product_id);
            if (!$product || $item->product_quantity > $product->qty) {
                $removeItem = Cart::where('user_id', Auth::id())->where('product_id', $item->product_id)->first();
                $removeItem->delete();
            }
        }

        $cartItems = Cart::where('user_id', Auth::id())->get();
        return view('user.checkout', compact('categoryAll', 'cartItems', 'countCart', 'countWish'));
    }

    public function placeOrder(Request $request)
    {
        $order = new Order();

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'mobile' => ['required', 'string', 'regex:/^(0\d{9,10})$/'],
            'address' => 'required|string|max:255',
        ]);
        $order->user_id = Auth::user()->id;
        $order->name = $validatedData['name'];
        $order->email = $request->input('email');
        $order->mobile = $validatedData['mobile'];
        $order->address = $validatedData['address'];
        $order->tracking_no = 'success' . random_int(111, 999);

        $total = 0;
        $cartItems_total = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems_total as $prod) {
            $total += $prod->products->selling_price;
        }
        $order->total_price = $total;

        $order->save();

        $cartItems = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $item->product_quantity,
                'price' => $item->products->selling_price,
            ]);
            $product = Product::where('id', $item->product_id)->first();
            $product->qty = $product->qty - $item->product_quantity;
            $product->update();
        }

        $cartItems = Cart::where('user_id', Auth::id())->get();
        Cart::destroy($cartItems);

        return redirect('/home')->with('success', 'Order place successfully.');
    }

    public function momoCheckout()
    {
        $categoryAll = Category::all();

        $cart = Cart::where('user_id', Auth::id())->get();
        $countCart = $cart->count();

        $wishlist = Wishlist::where('user_id', Auth::id())->get();
        $countWish = $wishlist->count();

        $oldCartItems = Cart::where('user_id', Auth::id())->get();
        if ($oldCartItems->count() == 0) {
            return redirect()->route('cart')->with('success', 'Your cart is empty.');
        }
        foreach ($oldCartItems as $item) {
            $product = Product::find($item->product_id);
            if (!$product || $item->product_quantity > $product->qty) {
                $removeItem = Cart::where('user_id', Auth::id())->where('product_id', $item->product_id)->first();
                $removeItem->delete();
            }
        }

        $cartItems = Cart::where('user_id', Auth::id())->get();

        return view('user.payment_momo', compact('categoryAll', 'countCart', 'countWish', 'cartItems'));
    }

    public function execPostRequest($url, $data)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt(
            $ch,
            CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data)
            )
        );
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        //execute post
        $result = curl_exec($ch);
        //close connection
        curl_close($ch);
        return $result;
    }

    public function momoPayment(Request $request)
    {

        $order = new Order();

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'mobile' => ['required', 'string', 'regex:/^(0\d{9,10})$/'],
            'address' => 'required|string|max:255',
        ]);
        $order->user_id = Auth::user()->id;
        $order->name = $validatedData['name'];
        $order->email = $request->input('email');
        $order->mobile = $validatedData['mobile'];
        $order->status = '1';
        $order->address = $validatedData['address'];
        $order->tracking_no = 'success' . random_int(111, 999);

        $total = 0;
        $cartItems_total = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems_total as $prod) {
            $total += $prod->products->selling_price;
        }
        $order->total_price = $total;

        $order->save();

        $cartItems = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $item->product_quantity,
                'price' => $item->products->selling_price,
            ]);
            $product = Product::where('id', $item->product_id)->first();
            $product->qty = $product->qty - $item->product_quantity;
            $product->update();
        }
        $cartItems = Cart::where('user_id', Auth::id())->get();
        Cart::destroy($cartItems);

        $endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";

        $partnerCode = 'MOMOBKUN20180529';
        $accessKey = 'klm05TvNBzhg7h7j';
        $secretKey = 'at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa';
        $orderInfo = "Thanh toán qua MoMo";
        $totalMomo =  $request->input('total_momo');
        $amount = $totalMomo;
        $orderId = time() . "";
        $redirectUrl = "http://localhost:8000/home";
        $ipnUrl = "http://localhost:8000/home";
        $extraData = "";

        $requestId = time() . "";
        $requestType = "payWithATM";
        //before sign HMAC SHA256 signature
        $rawHash = "accessKey=" . $accessKey . "&amount=" . $amount . "&extraData=" . $extraData . "&ipnUrl=" . $ipnUrl . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&partnerCode=" . $partnerCode . "&redirectUrl=" . $redirectUrl . "&requestId=" . $requestId . "&requestType=" . $requestType;
        $signature = hash_hmac("sha256", $rawHash, $secretKey);

        $data = array(
            'partnerCode' => $partnerCode,
            'partnerName' => "Test",
            "storeId" => "MomoTestStore",
            'requestId' => $requestId,
            'amount' => $amount,
            'orderId' => $orderId,
            'orderInfo' => $orderInfo,
            'redirectUrl' => $redirectUrl,
            'ipnUrl' => $ipnUrl,
            'lang' => 'vi',
            'extraData' => $extraData,
            'requestType' => $requestType,
            'signature' => $signature
        );
        $result = $this->execPostRequest($endpoint, json_encode($data));

        $jsonResult = json_decode($result, true);  // decode json

        return redirect()->to($jsonResult['payUrl'])->with('success', 'Order place successfully.');
    }

    public function vnpayCheckout()
    {

        $categoryAll = Category::all();

        $cart = Cart::where('user_id', Auth::id())->get();
        $countCart = $cart->count();

        $wishlist = Wishlist::where('user_id', Auth::id())->get();
        $countWish = $wishlist->count();

        $oldCartItems = Cart::where('user_id', Auth::id())->get();
        if ($oldCartItems->count() == 0) {
            return redirect()->route('cart')->with('success', 'Your cart is empty.');
        }
        foreach ($oldCartItems as $item) {
            $product = Product::find($item->product_id);
            if (!$product || $item->product_quantity > $product->qty) {
                $removeItem = Cart::where('user_id', Auth::id())->where('product_id', $item->product_id)->first();
                $removeItem->delete();
            }
        }

        $cartItems = Cart::where('user_id', Auth::id())->get();

        return view('user.payment_vnpay', compact('categoryAll', 'countCart', 'countWish', 'cartItems'));
    }

    public function vnpayPayment(Request $request)
    {
        $order = new Order();

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'mobile' => ['required', 'string', 'regex:/^(0\d{9,10})$/'],
            'address' => 'required|string|max:255',
        ]);
        $order->user_id = Auth::user()->id;
        $order->name = $validatedData['name'];
        $order->email = $request->input('email');
        $order->mobile = $validatedData['mobile'];
        $order->status = '1';
        $order->address = $validatedData['address'];
        $order->tracking_no = 'success' . random_int(111, 999);

        $total = 0;
        $cartItems_total = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems_total as $prod) {
            $total += $prod->products->selling_price;
        }
        $order->total_price = $total;

        $order->save();

        $cartItems = Cart::where('user_id', Auth::id())->get();
        foreach ($cartItems as $item) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $item->product_quantity,
                'price' => $item->products->selling_price,
            ]);
            $product = Product::where('id', $item->product_id)->first();
            $product->qty = $product->qty - $item->product_quantity;
            $product->update();
        }
        $cartItems = Cart::where('user_id', Auth::id())->get();
        Cart::destroy($cartItems);

        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = "http://localhost:8000/home";
        $vnp_TmnCode = "NGAYFMJ7";//Mã website tại VNPAY
        $vnp_HashSecret = "NJRIQXALCJERPEGVYAAKAMZZPHCWHFDL"; //Chuỗi bí mật

        $vnp_TxnRef = mt_rand(10000,99999); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = 'Thanh toán đơn hàng';
        $vnp_OrderType = 'billpayment';
        $totalVNPay =  $request->input('total_vnpay');
        $vnp_Amount = $totalVNPay;
        $vnp_Locale = 'vn';
        $vnp_BankCode = '';
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,

        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        //var_dump($inputData);
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array('code' => '00'
            , 'message' => 'success'
            , 'data' => $vnp_Url);
        if (isset($_POST['redirect'])) {
            header('Location: ' . $vnp_Url);
            die();

        } else {
            echo json_encode($returnData);
        }
    }
}
