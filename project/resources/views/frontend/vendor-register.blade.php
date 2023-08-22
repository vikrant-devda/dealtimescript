@extends('layouts.front')

@section('content')
@include('partials.global.common-header')

 <!-- breadcrumb -->
 <div class="full-row bg-light overlay-dark py-5" style="background-image: url({{ $gs->breadcrumb_banner ? asset('assets/images/'.$gs->breadcrumb_banner):asset('assets/images/noimage.png') }}); background-position: center center; background-size: cover;">
    <div class="container">
        <div class="row text-center text-white">
            <div class="col-12">
                <h3 class="mb-2 text-white">{{ __('Register') }}</h3>
            </div>
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 d-inline-flex bg-transparent p-0">
                        <li class="breadcrumb-item"><a href="{{ route('front.index') }}">{{ __('Home') }}</a></li>

                        <li class="breadcrumb-item active" aria-current="page">{{ __('Vendor Register') }}</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb -->

        <!--==================== Registration Form Start ====================-->
        <div class="full-row">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="woocommerce">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-12 mx-auto">
                                    <div class="registration-form border">
                                        @include('includes.admin.form-login')
                                        <h3>{{ __('Vendor Registration') }}</h3>
                                        <form class="clearfix" id="registerform" action="{{route('user-register-submit')}}" method="POST">
                                            @csrf
                                            <div id="vendor_form_screen">
                                                <div id="vendor_form_first_screen" class="vendor_form_tab" >
                                                    <p class="extra_mb_p">
                                                        <input type="text" name="shop_name" class="form-control" required=""  placeholder="{{ __('Business  Name') }}" >
                                                    </p>
                                                    
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <p>
                                                                <input type="text" name="name" required="" class="form-control" placeholder="{{ __('Contact Person') }}"  >
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <p>
                                                                <input type="text" name="phone" id="phone" class="form-control" required=""  placeholder="{{ __('Contact Person\'s Number') }}" >
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <p class="extra_mb_p">
                                                                <input type="text" name="business_phone" class="form-control" required=""  placeholder="{{ __('Busines Phone Number') }}" >
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <p>
                                                                <input type="email" name="email" class="form-control" required=""  placeholder="{{ __('Email Address') }}" >
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <p class="extra_mb_p">
                                                                <input type="text" name="reg_number" class="form-control" required=""  placeholder="{{ __('Busines Registration Number') }}" >
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <p>
                                                                <input type="text" name="shop_number" class="form-control" required=""  placeholder="Tax Identification Number (TIN)" >
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <p class="extra_mb_p">
                                                                <input type="text" name="address" class="form-control" required=""  placeholder="Location/Physical Address" >
                                                            </p>
                                                        </div>
                                                        <div class="col-lg-6">
                                                        </div>
                                                        <div class="col-lg-12">
                                                            
                                                        </div>
                                                    </div>
                                                    <button type="button" id="vendor_frm_next_btn" class="btn btn-primary float-none w-100 rounded-0 submit-btn" >Next</button>
                                                    
                                                    <p>
                                                            {{ __("Do have any account?") }}<a href="{{ route('user.login') }}"  class="text-secondary">{{__(' Login')}}</a>
                                                    </p>
                                                </div>
                                                <div id="vendor_form_second_screen"  class="vendor_form_tab" >
                                                        
                                                    <button type="button" id="vendor_frm_back_btn" class="btn btn-primary float-none w-100 rounded-0 submit-btn" >Back</button>
                                                <br>
                                                    <p>
                                                        <input type="text" name="shop_address" class="form-control"  required=""  placeholder="Business Category (e.g., restaurants, hotels, salons)" >
                                                    </p>
                                                    <p>
                                                        <input type="text" name="shop_message" class="form-control" required=""  placeholder="{{ __('Business Description') }}" >
                                                    </p>
                                                    
                                                    <p>
                                                        <input type="text" name="owner_name" class="form-control"    placeholder="Website " >

                                                    </p>
                                                    <p>
                                                        <input type="password" name="password" class="form-control" required=""  placeholder="{{ __('Password') }}" >
                                                    </p>
                                                    <p>
                                                        <input type="password" name="password_confirmation" class="form-control" required=""  placeholder="{{ __('Confirm Password') }}" >
                                                    </p>

                                                    @if($gs->is_capcha == 1)
                                                    <div class="form-input mb-3">
                                                        {!! NoCaptcha::display() !!}
                                                        {!! NoCaptcha::renderJs() !!}
                                                        @error('g-recaptcha-response')
                                                        <p class="my-2">{{$message}}</p>
                                                        @enderror
                                                    </div>
                                                    @endif
                                                    <input type="hidden" name="vendor"  value="1">
                                                    <input id="processdata" type="hidden" value="{{ __('Processing...') }}">
                                                    <input type="hidden"  name="register" value="Register">
                                                        <button type="button" id="vendor_form_submit" class="btn btn-primary float-none w-100 rounded-0 submit-btn">{{ __('Register') }}</button>
                                                    </p>
                                                    <p>
                                                            {{ __("Do have any account?") }}<a href="{{ route('user.login') }}"  class="text-secondary">{{__(' Login')}}</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--==================== Registration Form Start ====================-->


@include('partials.global.common-footer')
@endsection

@section('script')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/additional-methods.min.js"></script>
<script>
    $(function () {
        firstScreenHeight = $('#vendor_form_first_screen').height();
        secondScreenHeight = $('#vendor_form_second_screen').height();
        formHeight = 0;
        if(secondScreenHeight> firstScreenHeight){
            
            // $('#vendor_form_first_screen').height(secondScreenHeight+'px');
            formHeight = secondScreenHeight+'px';
        }else{
            
            // $('#vendor_form_second_screen').height(firstScreenHeight+'px');
            formHeight = firstScreenHeight+'px';
        }
        $('#vendor_form_screen').height(formHeight);
        $('#vendor_frm_next_btn').click(function (e) { 
            e.preventDefault();
            // $('#vendor_form_first_screen').hide();
            formValid = true;
            $("#vendor_form_first_screen  input").each(function() {
                
                if($(this).valid() == false){
                    formValid = false;
                    return false;
                }
            });
            if(formValid== true){
                $('#vendor_form_first_screen').animate({ width:'0' });
                $('#vendor_form_second_screen').animate({ width:'100%' });
                $('#vendor_form_first_screen').animate({ height:'0' });
            }

        });
        $('#vendor_frm_back_btn').click(function (e) { 
            e.preventDefault();
            // $('#vendor_form_first_screen').hide();
            $('#vendor_form_first_screen').height('100%');
            $('#vendor_form_first_screen').animate({ width:'100%' });
            $('#vendor_form_second_screen').animate({ width:'0' });
        });
        $('#registerform').validate();
        $('#vendor_form_submit').click(function (e) { 
            e.preventDefault();
            if($('#registerform').valid()){
                $('#registerform').submit();
            }
        });
        
    });
</script>

@endsection
