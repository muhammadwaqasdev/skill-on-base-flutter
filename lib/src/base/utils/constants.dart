import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';

enum UserTypes {
  USER,
  ADMIN
}

class Constants {
  Constants._();

  static List<Locale> get supportedLocales => [Locale('en')];

}
