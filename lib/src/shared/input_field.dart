import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/shared/spacing.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';

class MainInputField extends StatelessWidget {
  final bool isPassword;
  final bool obscureText;
  final String? label;
  final String hint;
  final TextEditingController controller;
  final Function? onTap;
  final Function? onDone;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final bool isRequired;
  final bool? readOnly;
  final bool? isDoB;
  final String error;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final int? lines;

  const MainInputField(
      {Key? key,
        this.width,
        this.height,
        this.isPassword = false,
        this.obscureText = false,
        this.label,
        required this.hint,
        required this.controller,
        this.onTap,
        this.inputType,
        this.onChanged,
        this.isRequired = true,
        this.suffixIcon,
        this.prefixIcon,
        required this.error,
        this.readOnly,
        this.lines,
        this.decoration,
        this.padding,
        this.textInputAction,
        this.onDone,
        this.isDoB,
        this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyling.semiBold.copyWith(
              color: (controller.text == "") ? context.appColorTheme().tertiary : context.appColorTheme().primary,
              fontSize: 14.sp
            ),
          ),
        if (label != null) VerticalSpacing(),
        Container(
          width: width ??
              ((context.isTablet)
                  ? context.screenSize().width * 0.7
                  : context.screenSize().width),
          height: height ?? 55.h,
          decoration: decoration ??
              ((controller.text == "") ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: context.appColorTheme().tertiary, width: 0.5)
                )
              ) : BoxDecoration(
                border: Border.all(
                  color: context.appColorTheme().primary,
                ),
                borderRadius: BorderRadius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              prefixIcon ?? SizedBox.shrink(),
              Expanded(
                child: Center(
                  child: TextFormField(
                    onTap: () {
                      onTap!();
                    },
                    textInputAction: textInputAction ?? TextInputAction.next,
                    keyboardType: inputType ?? TextInputType.text,
                    validator: (val) {
                      bool emailValid = true;
                      bool passwordValid = true;
                      if (inputType == TextInputType.emailAddress) {
                        emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(controller.text);
                      }
                      if (isPassword) {
                        if ((val?.length ?? 0) < 8) {
                          passwordValid = false;
                        }
                      }
                      return isRequired
                          ? (val!.isEmpty)
                          ? error
                          : (emailValid == false)
                          ? "enter valid email"
                          : (passwordValid == false)
                          ? "password must be at least 8 characters"
                          : null
                          : null;
                    },
                    onChanged: (val) {
                      onChanged!(val);
                    },
                    inputFormatters: [
                      if (inputType == TextInputType.phone)
                        MaskInputFormatter(mask: "### ### ####"),
                      if (isDoB == true) MaskInputFormatter(mask: "## ## ####")
                    ],
                    controller: controller,
                    readOnly: readOnly ?? false,
                    obscureText: obscureText,
                    onFieldSubmitted: (val) {
                      onDone!();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorStyle: TextStyling.regular.copyWith(
                          color: context.appColorTheme().error,
                          fontSize: 14.sp
                      ),
                      errorMaxLines: 1,
                      hintText: hint,
                      hintStyle: style ??
                          TextStyling.medium.copyWith(
                              color: (controller.text == "") ? context.appColorTheme().tertiary : context.appColorTheme().primary,
                              fontSize: 14.sp
                          ),
                      hintMaxLines: 1,
                      contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    ),
                    cursorColor: context.appColorTheme().primary,
                    cursorHeight: 20,
                    style: style ??
                        TextStyling.bold.copyWith(
                            color: (controller.text == "") ? context.appColorTheme().tertiary : context.appColorTheme().primary,
                            fontSize: 14.sp
                        ),
                  ),
                ),
              ),
              suffixIcon ?? SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}

// class CustomDropDown extends StatelessWidget {
//   final String? label;
//   final String value;
//   final List<DropdownMenuItem<String>> items;
//   final ValueChanged<String?> onChanged;
//   final double? width;
//   final double? height;
//
//   const CustomDropDown(
//       {Key? key,
//         this.label,
//         required this.value,
//         required this.items,
//         required this.onChanged,
//         this.width,
//         this.height})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null)
//           Text(
//             label!,
//             style: TextStyling.smallBold,
//           ),
//         VerticalSpacing(),
//         Container(
//           width: width ?? context.screenSize().width,
//           height: height ?? 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             color: AppColors.grey,
//           ),
//           padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
//           child: DropdownButton(
//             style: TextStyling.mediumRegular,
//             value: value,
//             underline: SizedBox.shrink(),
//             icon: const Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.transparent,
//             ),
//             items: items,
//             onChanged: (String? newValue) {
//               onChanged(newValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }