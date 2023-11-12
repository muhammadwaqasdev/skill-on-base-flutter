import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_on_base/src/configs/go_router.dart';

class NavService {
  static void splash(BuildContext ctx, {dynamic extra}) =>
      ctx.replace(NewGoRoute.splashView, extra: extra);
  static void login(BuildContext ctx, {dynamic extra}) =>
      ctx.replace(NewGoRoute.loginView, extra: extra);
  static Future<dynamic> forgotPassword(BuildContext ctx, {dynamic extra}) =>
      ctx.push(NewGoRoute.forgotPasswordView, extra: extra);
  static void register(BuildContext ctx, {dynamic extra}) =>
      ctx.replace(NewGoRoute.registerView, extra: extra);
  static Future<dynamic> verifyOtp(BuildContext ctx, {dynamic extra}) =>
      ctx.push(NewGoRoute.verifyOtpView, extra: extra);
  static void changePassword(BuildContext ctx, {dynamic extra}) =>
      ctx.go(NewGoRoute.changePasswordView, extra: extra);
  static void dashboard(BuildContext ctx, {dynamic extra}) =>
      ctx.go(NewGoRoute.dashboardView, extra: extra);
}
