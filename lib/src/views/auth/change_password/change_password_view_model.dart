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
import 'package:skill_on_base/src/models/FormData/login_form_model.dart';
import 'package:skill_on_base/src/models/FormData/social_login_form_model.dart';
import 'package:skill_on_base/src/models/user.dart';
import 'package:skill_on_base/src/services/local/base/auth_view_model.dart';
import 'package:skill_on_base/src/services/local/navigation_service.dart';
import 'package:skill_on_base/src/services/remote/base/api_view_model.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordViewModel extends ReactiveViewModel with AuthViewModel, ApiViewModel {
  final BuildContext context;
  final UserModel user;

  ChangePasswordViewModel(this.context, this.user);

  TextEditingController password = TextEditingController();
  bool isShowPassword = false;
  TextEditingController confirmPassword = TextEditingController();
  bool isShowConfirmPassword = false;


  init(){

  }

  onLogin(BuildContext ctx) async {
    if(password.text != confirmPassword.text){
      context.customWarningSnack(
          LocaleKeys.change_password_password_not_match_msg.tr());
    }else if (m.Form.of(ctx).validate()) {
      setBusy(true);
      dynamic _data = {
        "email": user.email,
        "password": password.text.trim(),
      };
      var response = await runBusyFuture(apiService.userChangePassword(_data, context));
      if (response == null) {
        setBusy(false);
        return;
      }
      response.when(success: (user) async {
        if (user.sId != null) {
          context.customSuccessSnack(
              LocaleKeys.change_password_success_msg.tr());
          NavService.login(context);
        }
        setBusy(false);
      }, failure: (error) {
        setBusy(false);
        return error;
      });
    }
  }

  onRegister() {
    NavService.register(context);
  }

  onGoogle() async {
    try {
      setBusy(true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        setBusy(false);
        return;
      }
      final GoogleSignInAuthentication? googleAuth =
      await googleUser.authentication;
      if (googleAuth == null) {
        setBusy(false);
        return;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential _user =
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (_user.user != null) {
        await _socialLogin(_user);
        setBusy(false);
      } else {
        setBusy(false);
      }
    } catch (e) {
      setBusy(false);
      return e;
    }
  }

  onApple() async {
    try {
      setBusy(true);
      final rawNonce = context.generateNonce();
      final nonce = context.sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      if (appleCredential == null) {
        setBusy(false);
        return;
      }
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      UserCredential _user =
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (_user.user != null) {
        await _socialLogin(_user);
        setBusy(false);
      } else {
        setBusy(false);
      }
    } catch (e) {
      setBusy(false);
      return e;
    }
  }

  onFacebook() async {
    try {
      setBusy(true);
      final LoginResult? loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']);
      if (loginResult?.accessToken == null) {
        context.customErrorSnack(loginResult?.message.toString() ?? '');
        setBusy(false);
        return;
      }
      final OAuthCredential? facebookAuthCredential =
      FacebookAuthProvider.credential(
          loginResult?.accessToken?.token ?? "");
      if (facebookAuthCredential == null) {
        setBusy(false);
        return;
      }
      UserCredential _user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (_user.user != null) {
        await _socialLogin(_user);
        setBusy(false);
      } else {
        setBusy(false);
      }
    } catch (e) {
      setBusy(false);
      return e;
    }
  }

  _socialLogin(UserCredential userCredential) async {
    final fcmToken = await FirebaseMessaging.instance
        .getToken()
        .onError((error, stackTrace) {
      setBusy(false);
    });

    log(fcmToken.toString(), name: "FCM Token");

    SocialLoginFormData _data = SocialLoginFormData(
        email: userCredential.user?.email ??
            userCredential.user?.providerData[0].email,
        fcm: fcmToken,
    );
    var response = await runBusyFuture(apiService.userSocialLogin(_data, context));
    if (response == null) {
      setBusy(false);
      return;
    }
    response.when(success: (user) async {
      if (user.sId != null) {
        authService.user = user;
        context.customSuccessSnack(
            LocaleKeys.log_in_login_success_msg.tr());
        NavService.dashboard(context);
      }
      setBusy(false);
    }, failure: (error) {
      setBusy(false);
      return error;
    });
  }
}
