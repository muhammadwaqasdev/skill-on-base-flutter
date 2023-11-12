import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/models/FormData/login_form_model.dart';
import 'package:skill_on_base/src/models/FormData/social_login_form_model.dart';
import 'package:skill_on_base/src/models/user.dart';
import 'package:skill_on_base/src/services/local/base/auth_view_model.dart';
import 'package:skill_on_base/src/services/local/navigation_service.dart';
import 'package:skill_on_base/src/services/remote/base/api_view_model.dart';
import 'package:stacked/stacked.dart';

class VerifyOtpViewModel extends ReactiveViewModel with AuthViewModel, ApiViewModel {
  final BuildContext context;
  final bool sendToPhone;
  UserModel user;

  VerifyOtpViewModel(this.context, this.sendToPhone, this.user);

  TextEditingController controller = TextEditingController();

  int seconds = 30;

  List<String> validOTPs = [];

  init(){
    validOTPs.add(user.otp ?? "");
    Timer.periodic(Duration(seconds: 1), (timer) {
      seconds--;
      if(seconds == 0){
        timer.cancel();
      }
      notifyListeners();
    });
  }

  resendOtp(BuildContext ctx) async {
    if (m.Form.of(ctx).validate()) {
      setBusy(true);

      dynamic data = {
        "email": user.email,
        "phone": user.phone,
        "toEmail": !sendToPhone
      };
      var response = await runBusyFuture(apiService.userResendOTP(data, context));
      if (response == null) {
        setBusy(false);
        return;
      }
      response.when(success: (userData) async {
        if (userData.sId != null) {
          user = userData;
          seconds = 30;
          init();
          print(user.otp);
        }
        setBusy(false);
      }, failure: (error) {
        setBusy(false);
        return error;
      });
    }
  }

}
