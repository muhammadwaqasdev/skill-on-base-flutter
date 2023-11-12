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

import 'login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget? child) {
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
                      LocaleKeys.log_in_title.tr(),
                      style: TextStyling.extraBold
                          .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
                    ),
                    Text(
                      LocaleKeys.log_in_sub_title.tr(),
                      style: TextStyling.medium
                          .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    ),
                    VerticalSpacing(24.h),
                    MainInputField(
                      hint: LocaleKeys.log_in_fields_email_hint.tr(),
                      label: LocaleKeys.log_in_fields_email_label.tr(),
                      inputType: TextInputType.emailAddress,
                      controller: model.email,
                      error: LocaleKeys.log_in_fields_email_error.tr(),
                      onChanged: (v) {
                        model.notifyListeners();
                      },
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: (model.email.text == "")
                            ? context.appColorTheme().tertiary
                            : context.appColorTheme().primary,
                        size: 24.r,
                      ),
                    ),
                    VerticalSpacing(15.h),
                    MainInputField(
                      hint: LocaleKeys.log_in_fields_password_hint.tr(),
                      label: LocaleKeys.log_in_fields_password_label.tr(),
                      controller: model.password,
                      textInputAction: TextInputAction.done,
                      onDone: (v) {
                        model.onLogin(ctx);
                      },
                      isPassword: true,
                      obscureText: (model.isShowPassword) ? false : true,
                      error: LocaleKeys.log_in_fields_password_error.tr(),
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
                    VerticalSpacing(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            NavService.forgotPassword(context);
                          },
                          child: Text(
                            LocaleKeys.log_in_forgot_password_btn.tr(),
                            style: TextStyling.regular
                                .copyWith(color: context.appColorTheme().onSecondary, fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacing(40.h),
                    MainButton(
                        text: LocaleKeys.log_in_login_btn.tr(),
                        bgColor: context.appColorTheme().primary,
                        onTap: () {
                          model.onLogin(ctx);
                        },
                        isPrimary: true,),
                    VerticalSpacing(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: context.appColorTheme().outline,
                            thickness: 2,
                          ),
                        ),
                        HorizontalSpacing(10),
                        Text(
                          "OR",
                          style: TextStyling.regular
                              .copyWith(color: context.appColorTheme().tertiary, fontSize: 14.sp),
                        ),
                        HorizontalSpacing(10),
                        Expanded(
                          child: Divider(
                            color: context.appColorTheme().outline,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacing(15.h),
                    MainButton(
                        text: LocaleKeys.log_in_google_btn.tr(),
                        icon: Image.asset(
                          Assets.imagesGoogleIcon,
                          height: 24.r,
                          width: 24.r,
                        ),
                        bgColor: Colors.red,
                        onTap: () {
                          model.onGoogle();
                        },
                      textColor: Colors.white,
                        isPrimary: true,),
                    VerticalSpacing(15.h),
                    if (Platform.isIOS)
                      MainButton(
                          text: LocaleKeys.log_in_apple_btn.tr(),
                          icon: Image.asset(
                            Assets.imagesAppleIcon,
                            height: 24.r,
                            width: 24.r,
                          ),
                          bgColor: Colors.black,
                          onTap: () {
                            model.onApple();
                          },
                        textColor: Colors.white,
                          isPrimary: true,),
                    if (Platform.isIOS) VerticalSpacing(15.h),
                    MainButton(
                        text: LocaleKeys.log_in_facebook_btn.tr(),
                        icon: Image.asset(
                          Assets.imagesFacebookIcon,
                          height: 24.r,
                          width: 24.r,
                        ),
                        bgColor: HexColor("#2258e9"),
                        onTap: () {
                          model.onFacebook();
                        },
                      textColor: Colors.white,
                        isPrimary: true,),
                    VerticalSpacing(35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: LocaleKeys.log_in_create_account_title.tr(),
                            style: TextStyling.regular
                                .copyWith(color: context.appColorTheme().tertiary, fontSize: 14.sp),
                            children: [
                              TextSpan(
                                text: LocaleKeys.log_in_create_account_btn.tr(),
                                style: TextStyling.bold
                                    .copyWith(color: context.appColorTheme().primary, fontSize: 16.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    model.onRegister();
                                  },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel(context);

  @override
  void onViewModelReady(LoginViewModel model) => model.init();
}
