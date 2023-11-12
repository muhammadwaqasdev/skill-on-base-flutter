import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/local/navigation_service.dart';
import 'package:skill_on_base/src/services/local/theme_service.dart';
import 'package:skill_on_base/src/shared/buttons.dart';
import 'package:skill_on_base/src/shared/input_field.dart';
import 'package:skill_on_base/src/shared/loading_indicator.dart';
import 'package:skill_on_base/src/shared/scaffold.dart';
import 'package:skill_on_base/src/shared/spacing.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:skill_on_base/generated/assets.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'dashboard_view_model.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  @override
  Widget builder(BuildContext context, DashboardViewModel model, Widget? child) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(40.h),
              Text(
                LocaleKeys.dashboard_title.tr(namedArgs: {"name": model.authService.user?.fullName ?? "User"}),
                style: TextStyling.extraBold
                    .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
              ),
              Text(
                LocaleKeys.dashboard_sub_title.tr(),
                style: TextStyling.medium
                    .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
              ),
              VerticalSpacing(24.h),
              MainButton(
                text: "LogOut",
                onTap: () {
                  model.authService.logout();
                  NavService.login(context);
                },
                isPrimary: true,),
            ],
          ),
          if (model.isBusy)
            Center(
              child: LoadingIndicator(
                size: 50.r,
              ),
            )
        ],
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) => DashboardViewModel(context);

  @override
  void onViewModelReady(DashboardViewModel model) => model.init();
}
