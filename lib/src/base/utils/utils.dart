import 'dart:convert';
import 'dart:math';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';

extension UIExt on BuildContext {
  double topSpace() => MediaQuery.of(this).padding.top;
  double appBarHeight() => AppBar().preferredSize.height;
  Size screenSize() => MediaQuery.of(this).size;
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;
  ThemeData appTheme() => Theme.of(this);
  TextTheme appTextTheme() => Theme.of(this).textTheme;
  ColorScheme appColorTheme() => Theme.of(this).colorScheme;

  void closeKeyboardIfOpen() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

  void customErrorSnack(String msg, {String? title}) {
    CherryToast.error(
      title: Text(
        title ?? "Error",
        style: TextStyling.semiBold
                  .copyWith(color: AppColors.lightTheme.error, fontSize: 14.sp),
      ),
      description: Text(
        msg.toString(),
        style: TextStyling.regular.copyWith(color: AppColors.lightTheme.error, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.lightTheme.surface,
      toastDuration: Duration(seconds: 5),
    ).show(this);
  }

  void customSuccessSnack(String msg, {String? title}) {
    CherryToast.success(
      title: Text(
        title ?? "Congrats",
        style: TextStyling.semiBold
            .copyWith(color: Colors.green, fontSize: 14.sp),
      ),
      description: Text(
        msg.toString(),
        style: TextStyling.regular.copyWith(color: Colors.green, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.lightTheme.surface,
      toastDuration: Duration(seconds: 5),
    ).show(this);
  }

  void customWarningSnack(String msg, {String? title}) {
    CherryToast.warning(
      title: Text(
        title ?? "Warning",
        style: TextStyling.semiBold
            .copyWith(color: Colors.orange, fontSize: 14.sp),
      ),
      description: Text(
        msg.toString(),
        style: TextStyling.regular.copyWith(color: Colors.orange, fontSize: 12.sp),
      ),
      backgroundColor: AppColors.lightTheme.surface,
      toastDuration: Duration(seconds: 5),
    ).show(this);
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
