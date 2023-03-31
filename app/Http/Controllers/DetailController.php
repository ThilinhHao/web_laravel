<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class DetailController extends Controller
{
    public function detail($id) {
        $categoryAll = Category::all();
        $product = Product::where('id', $id)->first();
        $category = Category::where('id', $product->cate_id)->first();
        return view('user.detail', compact('categoryAll', 'product', 'category'));

    }
}
