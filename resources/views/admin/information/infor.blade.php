@extends('layouts.admin')

@section('content')
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4 style="font-weight: bold;">User Pages</h4>
            <form action="{{route('user.search')}}"  method="GET" class="navbar-form">
                @csrf
                <div class="input-group no-border" >
                    <input type="text" name="searchTerm" value="{{ request()->get('searchTerm') }}" class="form-control" placeholder="Search...">
                    <button type="submit" class="btn btn-white btn-round btn-just-icon">
                        <i class="material-icons">search</i>
                        <div class="ripple-container"></div>
                    </button>
                </div>
                <span class="text-danger">
                    @error('searchTerm')
                        {{ $message }}
                    @enderror
                </span>
            </form>
        </div>

        @if (empty($userSearch))
            <div class="card-body">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($users as $user)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td>{{$user->name}}</td>
                            <td>{{$user->email}}</td>
                            <td>User</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                {{ $users->links('pagination::bootstrap-4') }}
            </div>
        @else
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($userSearch as $user)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{$user->name}}</td>
                        <td>{{$user->email}}</td>
                        <td>User</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            {{ $userSearch->links('pagination::bootstrap-4') }}
        </div>
        @endif
    </div>
@endsection
