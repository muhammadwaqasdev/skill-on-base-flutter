// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "main": {
    "app_name": "Skill On Base @",
    "app_description": "",
    "version": "v1.0.0",
    "ios_app_link": "",
    "android_app_link": "",
    "ios_identifier": "com.mobvers.skillOnBase",
    "android_identifier": "com.mobvers.skill_on_base",
    "powered_by": "Powered By Mobvers LLC"
  },
  "log_in": {
    "title": "Welcome Back",
    "sub_title": "Enter your details below",
    "fields": {
      "email": {
        "label": "Email",
        "hint": "Email",
        "error": "must be enter email"
      },
      "password": {
        "label": "Password",
        "hint": "Password",
        "error": "must be enter password"
      }
    },
    "forgot_password_btn": "Forgot Password",
    "login_btn": "Login",
    "login_success_msg": "Welcome back! You're now logged in and ready to explore!",
    "google_btn": "Continue with Google",
    "apple_btn": "Continue with Apple",
    "facebook_btn": "Continue with Facebook",
    "create_account": {
      "title": "Not a member? ",
      "btn": "Create Account"
    }
  },
  "register": {
    "title": "Welcome Back",
    "sub_title": "Enter your details below",
    "fields": {
      "full_name": {
        "label": "Full Name",
        "hint": "Full Name",
        "error": "must be enter full name"
      },
      "email": {
        "label": "Email",
        "hint": "Email",
        "error": "must be enter email"
      },
      "phone": {
        "label": "Phone",
        "hint": "Phone",
        "error": "must be enter phone"
      },
      "password": {
        "label": "Password",
        "hint": "Password",
        "error": "must be enter password"
      }
    },
    "register_btn": "Register",
    "register_success_msg": "Welcome back! You're now logged in and ready to explore!",
    "go_to_login": {
      "title": "Already a member? ",
      "btn": "Log In"
    }
  },
  "verify_otp": {
    "title": "Verify OTP",
    "sub_title": "Enter otp which sent to {number}",
    "incorrect_otp_error": "Your enter otp {otp} is incorrect, please enter correct otp",
    "otp_success_msg": "OTP Verified",
    "re_send_btn_hint": "Resend OTP {s}s",
    "re_send_btn": "Resend OTP"
  },
  "forgot_password": {
    "title": "Forgot Password",
    "sub_title": "Enter your details below",
    "fields": {
      "email": {
        "label": "Email",
        "hint": "Email",
        "error": "must be enter email"
      },
      "phone": {
        "label": "Phone",
        "hint": "Phone",
        "error": "must be enter phone"
      }
    },
    "success_msg": "Success",
    "main_btn": "Forgot Password"
  },
  "change_password": {
    "title": "Change Password",
    "sub_title": "Enter your details below",
    "fields": {
      "password": {
        "label": "Password",
        "hint": "Password",
        "error": "must be enter password"
      },
      "confirm_password": {
        "label": "Confirm Password",
        "hint": "Confirm Password",
        "error": "must be enter confirm password"
      }
    },
    "success_msg": "You Password Changes Successfully",
    "password_not_match_msg": "You Password and Confirm Password not Match!",
    "main_btn": "Update Password"
  },
  "dashboard": {
    "title": "Hello {name}",
    "sub_title": "Welcome back to explore the app"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
