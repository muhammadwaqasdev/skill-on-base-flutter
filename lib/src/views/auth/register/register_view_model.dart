import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/configs/go_router.dart';
import 'package:skill_on_base/src/models/FormData/login_form_model.dart';
import 'package:skill_on_base/src/models/FormData/register_form_data.dart';
import 'package:skill_on_base/src/models/FormData/social_login_form_model.dart';
import 'package:skill_on_base/src/services/local/base/auth_view_model.dart';
import 'package:skill_on_base/src/services/local/navigation_service.dart';
import 'package:skill_on_base/src/services/remote/base/api_view_model.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends ReactiveViewModel with AuthViewModel, ApiViewModel {
  final BuildContext context;

  RegisterViewModel(this.context);

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = false;


  init(){

  }

  onRegister(BuildContext ctx) async {
    if (m.Form.of(ctx).validate()) {
      setBusy(true);
      final fcmToken = await FirebaseMessaging.instance
          .getToken()
          .onError((error, stackTrace) {
        setBusy(false);
      });

      log(fcmToken.toString(), name: "FCM Token");
      RegisterFormData _data = RegisterFormData(
        fullName: fullName.text,
        email: email.text.trim(),
        phone: phone.text,
        password: password.text.trim(),
        fcm: fcmToken,
      );
      var response = await runBusyFuture(apiService.userRegister(_data, context));
      if (response == null) {
        setBusy(false);
        return;
      }
      response.when(success: (user) async {
        if (user.sId != null) {
          context.customSuccessSnack(
              LocaleKeys.register_register_success_msg.tr());
          print(user.otp);
          NavService.verifyOtp(context, extra: VerifyOtpViewExtra(user: user, sendToPhone: true));
        }
        setBusy(false);
      }, failure: (error) {
        setBusy(false);
        return error;
      });
    }
  }

  onLogin() {
    NavService.login(context);
  }
}
