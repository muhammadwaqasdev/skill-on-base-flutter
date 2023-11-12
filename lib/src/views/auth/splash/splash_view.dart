import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/local/theme_service.dart';
import 'package:skill_on_base/src/shared/spacing.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:skill_on_base/generated/assets.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'splash_view_model.dart';

class SplashView extends StackedView<SplashViewModel> {
  @override
  Widget builder(BuildContext context, SplashViewModel model, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getThemeManager(context).isDarkMode
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          width: context.screenSize().width,
          height: context.screenSize().height,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.appColorTheme().primary,
                context.appColorTheme().onPrimary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Image.asset(
              Assets.imagesLogo,
              width: context.screenSize().width,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) =>
      SplashViewModel(context);

  @override
  void onViewModelReady(SplashViewModel model) => model.init();
}
