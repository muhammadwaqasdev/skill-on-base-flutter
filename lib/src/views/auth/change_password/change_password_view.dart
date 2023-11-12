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
import 'package:skill_on_base/src/models/user.dart';
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

import 'change_password_view_model.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  final UserModel user;

  ChangePasswordView(this.user);
  @override
  Widget builder(BuildContext context, ChangePasswordViewModel model, Widget? child) {
    return CustomScaffold(
      body: Stack(
        children: [
          Form(
            child: Builder(builder: (BuildContext ctx) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(40.h),
                    Text(
                      LocaleKeys.change_password_title.tr(),
                      style: TextStyling.extraBold
                          .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
                    ),
                    Text(
                      LocaleKeys.change_password_sub_title.tr(),
                      style: TextStyling.medium
                          .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    ),
                    VerticalSpacing(24.h),
                    MainInputField(
                      hint: LocaleKeys.change_password_fields_password_hint.tr(),
                      label: LocaleKeys.change_password_fields_password_label.tr(),
                      controller: model.password,
                      isPassword: true,
                      obscureText: (model.isShowPassword) ? false : true,
                      error: LocaleKeys.change_password_fields_password_error.tr(),
                      onChanged: (v) {
                        model.notifyListeners();
                      },
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: (model.password.text == "")
                            ? context.appColorTheme().tertiary
                            : context.appColorTheme().primary,
                        size: 24.r,
                      ),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          model.isShowPassword = !model.isShowPassword;
                          model.notifyListeners();
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 24.r,
                          color: (model.password.text == "")
                              ? context.appColorTheme().tertiary
                              : context.appColorTheme().primary,
                        ),
                      ),
                    ),
                    VerticalSpacing(15.h),
                    MainInputField(
                      hint: LocaleKeys.change_password_fields_confirm_password_hint.tr(),
                      label: LocaleKeys.change_password_fields_confirm_password_label.tr(),
                      controller: model.confirmPassword,
                      textInputAction: TextInputAction.done,
                      onDone: (v) {
                        model.onLogin(ctx);
                      },
                      isPassword: true,
                      obscureText: (model.isShowConfirmPassword) ? false : true,
                      error: LocaleKeys.change_password_fields_confirm_password_error.tr(),
                      onChanged: (v) {
                        model.notifyListeners();
                      },
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: (model.confirmPassword.text == "")
                            ? context.appColorTheme().tertiary
                            : context.appColorTheme().primary,
                        size: 24.r,
                      ),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          model.isShowConfirmPassword = !model.isShowConfirmPassword;
                          model.notifyListeners();
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 24.r,
                          color: (model.confirmPassword.text == "")
                              ? context.appColorTheme().tertiary
                              : context.appColorTheme().primary,
                        ),
                      ),
                    ),
                    VerticalSpacing(40.h),
                    MainButton(
                        text: LocaleKeys.change_password_main_btn.tr(),
                        bgColor: context.appColorTheme().primary,
                        onTap: () {
                          model.onLogin(ctx);
                        },
                        isPrimary: true,),
                  ],
                ),
              );
            }),
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
  ChangePasswordViewModel viewModelBuilder(BuildContext context) => ChangePasswordViewModel(context, user);

  @override
  void onViewModelReady(ChangePasswordViewModel model) => model.init();
}
