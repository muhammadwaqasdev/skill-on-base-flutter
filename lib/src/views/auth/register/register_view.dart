import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/shared/buttons.dart';
import 'package:skill_on_base/src/shared/input_field.dart';
import 'package:skill_on_base/src/shared/loading_indicator.dart';
import 'package:skill_on_base/src/shared/scaffold.dart';
import 'package:skill_on_base/src/shared/spacing.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';
import 'package:stacked/stacked.dart';
import 'package:skill_on_base/generated/assets.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';

import 'register_view_model.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  @override
  Widget builder(BuildContext context, RegisterViewModel model, Widget? child) {
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
                      LocaleKeys.register_title.tr(),
                      style: TextStyling.extraBold
                          .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
                    ),
                    Text(
                      LocaleKeys.register_sub_title.tr(),
                      style: TextStyling.medium
                          .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    ),
                    VerticalSpacing(24.h),
                    MainInputField(
                      hint: LocaleKeys.register_fields_full_name_hint.tr(),
                      label: LocaleKeys.register_fields_full_name_label.tr(),
                      error: LocaleKeys.register_fields_full_name_error.tr(),
                      inputType: TextInputType.text,
                      controller: model.fullName,
                      onChanged: (v) {
                        model.notifyListeners();
                      },
                      prefixIcon: Icon(
                        Icons.person,
                        color: (model.fullName.text == "")
                            ? context.appColorTheme().tertiary
                            : context.appColorTheme().primary,
                        size: 24.r,
                      ),
                    ),
                    VerticalSpacing(15.h),
                    MainInputField(
                      hint: LocaleKeys.register_fields_email_hint.tr(),
                      label: LocaleKeys.register_fields_email_label.tr(),
                      error: LocaleKeys.register_fields_email_error.tr(),
                      inputType: TextInputType.emailAddress,
                      controller: model.email,
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
                      hint: LocaleKeys.register_fields_phone_hint.tr(),
                      label: LocaleKeys.register_fields_phone_label.tr(),
                      error: LocaleKeys.register_fields_phone_error.tr(),
                      controller: model.phone,
                      onChanged: (v) {
                        model.notifyListeners();
                      },
                      prefixIcon: Icon(
                        Icons.phone,
                        color: (model.phone.text == "")
                            ? context.appColorTheme().tertiary
                            : context.appColorTheme().primary,
                        size: 24.r,
                      ),
                    ),
                    VerticalSpacing(15.h),
                    MainInputField(
                      hint: LocaleKeys.register_fields_password_hint.tr(),
                      label: LocaleKeys.register_fields_password_label.tr(),
                      error: LocaleKeys.register_fields_password_error.tr(),
                      controller: model.password,
                      textInputAction: TextInputAction.done,
                      onDone: (v) {
                        model.onRegister(ctx);
                      },
                      isPassword: true,
                      obscureText: (model.isShowPassword) ? false : true,
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
                    VerticalSpacing(40.h),
                    MainButton(
                        text: LocaleKeys.register_register_btn.tr(),
                        onTap: () {
                          model.onRegister(ctx);
                        },
                        isPrimary: true,),
                    VerticalSpacing(35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: LocaleKeys.register_go_to_login_title.tr(),
                            style: TextStyling.regular
                                .copyWith(color: context.appColorTheme().tertiary, fontSize: 14.sp),
                            children: [
                              TextSpan(
                                text: LocaleKeys.register_go_to_login_btn.tr(),
                                style: TextStyling.bold
                                    .copyWith(color: context.appColorTheme().primary, fontSize: 16.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    model.onLogin();
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
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel(context);

  @override
  void onViewModelReady(RegisterViewModel model) => model.init();
}
