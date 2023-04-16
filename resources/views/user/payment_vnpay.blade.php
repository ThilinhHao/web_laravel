@extends('layouts.user')
@section('count-cart', $countCart)
@section('count-wishlist', $countWish)

@section('content')

<form action="{{ url('vnpay-payment') }}" method="post">
    @csrf
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Name</label>
                        <input class="form-control" name="name" type="text" placeholder="">
                        <span class="text-danger">
                            @error('name')
                                {{ $message }}
                            @enderror
                        </span>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>E-mail</label>
                        <input class="form-control" name="email" value="{{ Auth::user()->email }}" type="text"
                            readonly placeholder="">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Mobile</label>
                        <input class="form-control" name="mobile" type="text" placeholder="">
                        <span class="text-danger">
                            @error('mobile')
                                {{ $message }}
                            @enderror
                        </span>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Address</label>
                        <input class="form-control" name="address" type="text" placeholder="">
                        <span class="text-danger">
                            @error('address')
                                {{ $message }}
                            @enderror
                        </span>
                    </div>
                </div>
            </div>
        </div>
        @php
            $total = 0;
        @endphp
        @foreach ($cartItems as $item)
            @php
                $total += $item->products->selling_price * $item->product_quantity;
            @endphp
        @endforeach
        @php
            $total_vnd = round($total * 24000);
        @endphp
        <div class="col-md-6 form-group">
            <input type="hidden" name="total_vnpay" value="{{$total_vnd}}">
            <button type="submit" name="redirect" style="background-color: #008CBA; color: #fff; border: none; padding: 10px 20px; border-radius: 4px; font-size: 18px; font-weight: bold; cursor: pointer; transition: background-color 0.3s ease;">
                Thanh toán qua VNPay
            </button>
        </div>
        <div class="col-md-6 form-group">
            <button type="button" onclick="window.location='{{ url('checkout') }}'" style="width: 100px;" class="btn btn-lg btn-block btn-secondary font-weight-bold my-3 py-3">Back</button>
        </div>
    </div>
</form>
@endsection
