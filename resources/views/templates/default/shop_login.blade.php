@extends($theme.'.shop_layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
                <h2 class="title text-center">{{ $title }}</h2>
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Login to your account</h2>
                        <form action="{{ route('postLogin') }}" method="post"  class="box">
                            {!! csrf_field() !!}
                            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                <label for="email" class="control-label">Your email</label>
                                    <input class="is_required validate account_input form-control {{ ($errors->has('email'))?"input-error":"" }}"   type="text" name="email" value="{{ old('email') }}" >
                                        @if ($errors->has('email'))
                                            <span class="help-block">
                                                {{ $errors->first('email') }}
                                            </span>
                                        @endif

                            </div>
                          
                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" class="control-label">Your password</label>
                                    <input class="is_required validate account_input form-control {{ ($errors->has('password'))?"input-error":"" }}"   type="password" " name="password" value="" >
                                        @if ($errors->has('password'))
                                            <span class="help-block">
                                                {{ $errors->first('password') }}
                                            </span>
                                        @endif

                            </div>
                        <p class="lost_password form-group">
                            <a class="btn btn-link" href="{{ route('forgot') }}">
                                Forgot password?
                            </a>
                            <br>
                        </p>
                            <button type="submit" name="SubmitLogin" class="btn btn-default">Login</button>
                        </form>
                    </div><!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <!--   sign up form    -->
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h2>New User Signup!</h2>
                        <form action="{{route('postRegister')}}" method="post"  class="box">
                            {!! csrf_field() !!}
                <div class="form_content {{ (old('check_red'))?'in':'' }}" id="collapseExample">
                    <div class="form-group{{ $errors->has('reg_name') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_name'))?"input-error":"" }}"   name="reg_name" placeholder="Name" value="{{ old('reg_name') }}">
                        @if ($errors->has('reg_name'))
                        <span class="help-block">
                            {{ $errors->first('reg_name') }}
                        </span>
                        @endif
                    </div>
                    <div class="form-group{{ $errors->has('reg_email') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_email'))?"input-error":"" }}"   name="reg_email" placeholder="Email" value="{{ old('reg_email') }}">
                        @if ($errors->has('reg_email'))
                        <span class="help-block">
                            {{ $errors->first('reg_email') }}
                        </span>
                        @endif
                    </div>

                    <div class="form-group{{ $errors->has('reg_phone') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_phone'))?"input-error":"" }}"   name="reg_phone" placeholder="Phone" value="{{ old('reg_phone') }}">
                        @if ($errors->has('reg_phone'))
                        <span class="help-block">
                            {{ $errors->first('reg_phone') }}
                        </span>
                        @endif
                    </div>

                    <div class="form-group{{ $errors->has('reg_address1') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_address1'))?"input-error":"" }}"   name="reg_address1" placeholder="Address 1" value="{{ old('reg_address1') }}">
                        @if ($errors->has('reg_address1'))
                        <span class="help-block">
                            {{ $errors->first('reg_address1') }}
                        </span>
                        @endif
                    </div>

                    <div class="form-group{{ $errors->has('reg_address2') ? ' has-error' : '' }}">
                        <input  type="text" class="is_required validate account_input form-control {{ ($errors->has('reg_address2'))?"input-error":"" }}"   name="reg_address2" placeholder="Address 2" value="{{ old('reg_address2') }}">
                        @if ($errors->has('reg_address2'))
                        <span class="help-block">
                            {{ $errors->first('reg_address2') }}
                        </span>
                        @endif
                    </div>

                    <div class="form-group{{ $errors->has('reg_password') ? ' has-error' : '' }}">
                        <input  type="password" class="is_required validate account_input form-control {{ ($errors->has('reg_password'))?"input-error":"" }}"   name="reg_password" placeholder="Password" value="">
                        @if ($errors->has('reg_password'))
                        <span class="help-block">
                            {{ $errors->first('reg_password') }}
                        </span>
                        @endif
                    </div>
                    <div class="form-group{{ $errors->has('reg_password_confirmation') ? ' has-error' : '' }}">
                        <input type="password" class="is_required validate account_input form-control {{ ($errors->has('reg_password_confirmation'))?"input-error":"" }}"  placeholder="Password confirm" name="reg_password_confirmation" value="">
                        @if ($errors->has('reg_password_confirmation'))
                        <span class="help-block">
                            {{ $errors->first('reg_password_confirmation') }}
                        </span>
                        @endif
                    </div>
                    <input type="hidden" name="check_red" value="1">
                    <div class="submit">
                        <button type="submit" name="SubmitCreate" class="btn btn-default">Signup</button>
                    </div>
                </div>

                        </form>
                    </div><!--/sign up form-->
                </div>
            </div>
        </div>
    </section><!--/form-->
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
