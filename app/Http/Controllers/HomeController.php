<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function userIndex() {
        $categoryAll = Category::all();
        $productTrending = Product::where('trending', '!=', '0')->get();
        $productPopular = Product::where('status', '!=', '0')->get();
        return view('user.index', compact('categoryAll', 'productTrending', 'productPopular'));
    }


    public function contact() {
        $categoryAll = Category::all();

        return view('user.contact', compact('categoryAll'));
    }

    public function checkout() {
        $categoryAll = Category::all();

        return view('user.checkout', compact('categoryAll'));
    }

}
