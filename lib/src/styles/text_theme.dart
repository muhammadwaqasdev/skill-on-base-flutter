import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';

class TextStyling {
  TextStyling._();

  static TextStyle extraBold = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w800,
    fontSize: 2.sp,
  );
  static TextStyle bold = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w700,
    fontSize: 2.sp,
  );
  static TextStyle semiBold = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w600,
    fontSize: 2.sp,
  );
  static TextStyle medium = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w500,
    fontSize: 2.sp,
  );
  static TextStyle regular = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w400,
    fontSize: 2.sp,
  );
  static TextStyle thin = GoogleFonts.sourceSerif4(
    fontWeight: FontWeight.w300,
    fontSize: 2.sp,
  );
}
