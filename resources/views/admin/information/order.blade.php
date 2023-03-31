@extends('layouts.admin')

@section('content')
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4 style="font-weight: bold;">Product Pages</h4>
            <form action=""  method="GET" class="navbar-form">
                @csrf
                <div class="input-group no-border" >
                    <input type="text" name="searchTerm" value="" class="form-control" placeholder="Search...">
                    <button type="submit" class="btn btn-white btn-round btn-just-icon">
                        <i class="material-icons">search</i>
                        <div class="ripple-container"></div>
                    </button>
                </div>
            </form>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th style="text-align:center;">No</th>
                        <th style="text-align:center;">Name</th>
                        <th style="text-align:center;">Type</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>hao123</td>
                        <td>User</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
@endsection
