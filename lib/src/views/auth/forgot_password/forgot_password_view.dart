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

import 'forgot_password_view_model.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  @override
  Widget builder(BuildContext context, ForgotPasswordViewModel model, Widget? child) {
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
                      LocaleKeys.forgot_password_title.tr(),
                      style: TextStyling.extraBold
                          .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
                    ),
                    Text(
                      LocaleKeys.forgot_password_sub_title.tr(),
                      style: TextStyling.medium
                          .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    ),
                    VerticalSpacing(15.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Radio(value: true, groupValue: model.isEmail, onChanged: (v){
                    //           model.isEmail = true;
                    //           model.notifyListeners();
                    //         }),
                    //         Text(
                    //           LocaleKeys.forgot_password_fields_email_label.tr(),
                    //           style: TextStyling.medium
                    //               .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Radio(value: false, groupValue: model.isEmail, onChanged: (v){
                    //           model.isEmail = false;
                    //           model.notifyListeners();
                    //         }),
                    //         Text(
                    //           LocaleKeys.forgot_password_fields_phone_label.tr(),
                    //           style: TextStyling.medium
                    //               .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    VerticalSpacing(15.h),
                    if(model.isEmail == true)
                      MainInputField(
                      hint: LocaleKeys.forgot_password_fields_email_hint.tr(),
                      label: LocaleKeys.forgot_password_fields_email_label.tr(),
                      inputType: TextInputType.emailAddress,
                      controller: model.email,
                      error: LocaleKeys.forgot_password_fields_email_error.tr(),
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
                    // if(model.isEmail == false)
                    //   MainInputField(
                    //     hint: LocaleKeys.forgot_password_fields_phone_hint.tr(),
                    //     label: LocaleKeys.forgot_password_fields_phone_label.tr(),
                    //     inputType: TextInputType.phone,
                    //     controller: model.phone,
                    //     error: LocaleKeys.forgot_password_fields_phone_error.tr(),
                    //     onChanged: (v) {
                    //       model.notifyListeners();
                    //     },
                    //     prefixIcon: Icon(
                    //       Icons.phone,
                    //       color: (model.phone.text == "")
                    //           ? context.appColorTheme().tertiary
                    //           : context.appColorTheme().primary,
                    //       size: 24.r,
                    //     ),
                    //   ),
                    VerticalSpacing(40.h),
                    MainButton(
                        text: LocaleKeys.forgot_password_main_btn.tr(),
                        bgColor: context.appColorTheme().primary,
                        onTap: () {
                          model.onForgotPassword(ctx);
                        },
                        isPrimary: true,),
                    VerticalSpacing(15.h),
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
  ForgotPasswordViewModel viewModelBuilder(BuildContext context) => ForgotPasswordViewModel(context);

  @override
  void onViewModelReady(ForgotPasswordViewModel model) => model.init();
}
