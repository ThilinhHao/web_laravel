<?php

namespace App\Http\Controllers\Admin;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    //
    public function index() {
        $orders = Order::paginate(6);

        return view('admin.information.order', compact('orders'));
    }

    public function orderDetail($id) {
        $orders = Order::where('id', $id)->first();

        return view('admin.information.detail', compact('orders'));
    }
}
