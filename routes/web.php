<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\CartControlller;
use App\Http\Controllers\DetailController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\Admin\InforController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\FrontendController;
use App\Http\Controllers\Admin\LanguageController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
php artisan serve --host=localhost --port=8000
đổi cổng port để đăng nhập bằng fb và gg.

test momo:
sdt: 0919100100
stk : 9704 0000 0000 0018
ten chu the : NGUYEN VAN A
ngay cap : 03/07

Tạo repository: xử lí logic và truy vấn sql.
Khởi tạo controller và gọi Repository return view hoặc validate
Khởi tạo form request: xử lí validate tại đây.
Khởi tạo model: xử lí mối quan hệ 1-1, 1-n ,n-n,
Khi update thì nên dùng file or fail

*/
Route::get('/', function () {
    return view('welcome');
});

// Route::get('/user', [HomeController::class, 'userIndex']);

// shop product
Route::get('shop', [ShopController::class, 'shopIndex']);
Route::get('shopsort', [ShopController::class, 'shopSort'])->name('shop.sort');
Route::get('shopsearch', [ShopController::class, 'search'])->name('shop.search');
Route::get('shopprice', [ShopController::class, 'searchPrice'])->name('shop.price');

Route::get('detail/{id}', [DetailController::class, 'detail']);
Route::get('/detail/{id}/reviews/more', [DetailController::class, 'moder'])->name('reviews.more');

Route::get('contact', [HomeController::class, 'contact']);
Route::get('checkout', [CheckoutController::class, 'index']);
Route::post('place-order', [CheckoutController::class, 'placeOrder']);
Route::get('my-order', [HomeController::class, 'myOrder']);
Route::get('view-order/{id}', [HomeController::class, 'viewOrder']);

// add rating
Route::get('add-rating', [RatingController::class, 'add']);
Route::post('add-review/{id}', [RatingController::class, 'review']);

// add review

// shop cart
Route::get('cart', [CartControlller::class, 'shopCart'])->name('cart');
Route::post('add-to-cart', [CartControlller::class, 'addProduct']);
Route::post('update-cart', [CartControlller::class, 'updateCart']);
Route::post('delete-cart-item', [CartControlller::class, 'deleteProduct']);

// Thanh toán momo
Route::get('momo-checkout', [CheckoutController::class, 'momoCheckout']);
Route::post('momo-payment', [CheckoutController::class, 'momoPayment']);

// Thanh toán vnpay
Route::get('vnpay-checkout', [CheckoutController::class, 'vnpayCheckout']);
Route::post('vnpay-payment', [CheckoutController::class, 'vnpayPayment']);

// wish list
Route::get('wishlist', [WishlistController::class, 'index']);
Route::post('add-to-wishlist', [WishlistController::class, 'add']);
Route::post('delete-to-wishlist', [WishlistController::class, 'destroy']);

Route::get('/get-cart-wishlist-count', [CartControlller::class, 'getCartWishlistCount'])->name('get.cart.wishlist.count');

Auth::routes(['verify' => true]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

//Google login
Route::get('login/google', [App\Http\Controllers\Auth\LoginController::class, 'redirectToGoogle'])->name('login.google');
Route::get('login/google/callback', [App\Http\Controllers\Auth\LoginController::class, 'handleGoogleCallback']);

// Facebook login
Route::get('login/facebook', [App\Http\Controllers\Auth\LoginController::class, 'redirectToFacebook'])->name('login.facebook');
Route::get('login/facebook/callback', [App\Http\Controllers\Auth\LoginController::class, 'handleFacebookCallback']);

Route::middleware(['auth','isAdmin'])->group(function () {

    Route::get('/dashboard', [FrontendController::class, 'index']);

    Route::get('language/{language}', [LanguageController::class, 'index'])->name('language.index');
    // category
    Route::get('categories', [CategoryController::class, 'index']);
    Route::get('add-category', [CategoryController::class, 'add']);
    Route::post('insert-category', [CategoryController::class, 'insert']);
    Route::get('edit-category/{id}', [CategoryController::class, 'edit']);
    Route::put('update-category/{id}', [CategoryController::class, 'update']);
    Route::get('searchcategory', [CategoryController::class,'search'])->name('category.search');
    Route::get('delete-category/{id}', [CategoryController::class,'destroy']);
    // product
    Route::get('products', [ProductController::class, 'index']);
    Route::get('add-product', [ProductController::class, 'add']);
    Route::post('insert-product', [ProductController::class, 'insert']);
    Route::get('edit-product/{id}', [ProductController::class, 'edit']);
    Route::put('update-product/{id}', [ProductController::class, 'update']);
    Route::get('searchproduct', [ProductController::class,'search'])->name('product.search');
    Route::get('delete-product/{id}', [ProductController::class, 'destroy']);

    // information
    Route::get('infor', [InforController::class, 'index']);
    Route::get('order', [OrderController::class, 'index']);
    Route::get('profile', [ProfileController::class, 'index']);
    Route::get('searchuser', [InforController::class, 'search'])->name('user.search');
    Route::get('order-detail/{id}', [OrderController::class, 'orderDetail']);
});

