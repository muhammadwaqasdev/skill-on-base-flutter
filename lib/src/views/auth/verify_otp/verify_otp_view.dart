import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/configs/go_router.dart';
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

import 'verify_otp_view_model.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  final UserModel user;
  final bool sendToPhone;

  VerifyOtpView({required this.user, required this.sendToPhone});
  @override
  Widget builder(BuildContext context, VerifyOtpViewModel model, Widget? child) {
    return CustomScaffold(
      body: Stack(
        children: [
          Form(
            child: Builder(builder: (BuildContext ctx) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(20.h),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back_ios, size: 30.r,
                        color: context.appColorTheme().primary,),),
                      ],
                    ),
                    VerticalSpacing(10.h),
                    Text(
                      LocaleKeys.verify_otp_title.tr(),
                      style: TextStyling.extraBold
                          .copyWith(color: context.appColorTheme().primary, fontSize: 26.sp),
                    ),
                    Text(
                      LocaleKeys.verify_otp_sub_title.tr(namedArgs: {"number": sendToPhone ? (user.phone ?? "") : (user.email ?? "")}),
                      style: TextStyling.medium
                          .copyWith(color: context.appColorTheme().onBackground, fontSize: 14.sp),
                    ),
                    VerticalSpacing(24.h),
                    Center(
                      child: Pinput(
                        defaultPinTheme: PinTheme(
                          width: 64,
                          height: 64,
                          textStyle: TextStyling.semiBold.copyWith(color: context.appColorTheme().onPrimary, fontSize: 16.sp, ),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.appColorTheme().onPrimary,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 76,
                          height: 76,
                          textStyle: TextStyling.semiBold.copyWith(color: context.appColorTheme().primary, fontSize: 16.sp, ),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.appColorTheme().primary,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        submittedPinTheme: PinTheme(
                          width: 64,
                          height: 64,
                          textStyle: TextStyling.semiBold.copyWith(color: context.appColorTheme().primary, fontSize: 16.sp, ),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.appColorTheme().primary,),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        controller: model.controller,
                        onCompleted: (pin) {
                          if(model.validOTPs.contains(pin)){
                            if(sendToPhone){
                              user.otp = null;
                              model.authService.user = user;
                              NavService.dashboard(context);
                            }else{
                              NavService.changePassword(context, extra: ChangePasswordViewExtra(user: user));
                            }
                          }else{
                            context.customErrorSnack(LocaleKeys.verify_otp_incorrect_otp_error.tr(namedArgs: {"otp": pin}));
                            model.controller.clear();
                          }
                        },
                      ),
                    ),
                    VerticalSpacing(15.h),
                    Center(
                      child: (model.seconds > 0) ? Text(
                        LocaleKeys.verify_otp_re_send_btn_hint.tr(namedArgs: {"s": model.seconds.toString()}),
                        style: TextStyling.extraBold
                            .copyWith(color: context.appColorTheme().tertiary, fontSize: 14.sp),
                      ) : InkWell(
                        onTap: (){
                          model.resendOtp(ctx);
                        },
                        child: Text(
                          LocaleKeys.verify_otp_re_send_btn.tr(),
                          style: TextStyling.extraBold
                              .copyWith(color: context.appColorTheme().onSecondary, fontSize: 14.sp),
                        ),
                      ),
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
  VerifyOtpViewModel viewModelBuilder(BuildContext context) => VerifyOtpViewModel(context, sendToPhone, user);

  @override
  void onViewModelReady(VerifyOtpViewModel model) => model.init();
}
