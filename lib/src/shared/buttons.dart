import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:skill_on_base/src/styles/text_theme.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Widget? icon;
  final Function onTap;
  final Color? bgColor;
  final Color? textColor;
  final bool? isBusy;
  final bool isPrimary;
  final TextStyle? style;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const MainButton(
      {Key? key,
      required this.text,
      this.width,
      this.height,
      this.icon,
      required this.onTap,
      this.margin,
      this.bgColor,
      this.textColor,
      this.style,
      this.isBusy,
      this.borderRadius,
      this.padding,
      required this.isPrimary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isBusy != true) onTap();
      },
      child: Container(
        width: width ??
            ((context.isTablet)
                ? context.screenSize().width * 0.7
                : context.screenSize().width),
        height: height ?? 52.h,
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            color: bgColor ??
                ((isPrimary == true)
                    ? context.appColorTheme().primary
                    : Colors.transparent),
            border: Border.all(
                color: bgColor ?? ((isPrimary == true)
                    ? context.appColorTheme().primary
                    : context.appColorTheme().secondary))),
        padding: padding ?? EdgeInsets.fromLTRB(20, 10, 20, 10),
        margin: margin,
        child: (isBusy == true)
            ? Center(
                child: CircularProgressIndicator(
                color: textColor ?? context.appColorTheme().background,
              ))
            : Row(
                mainAxisAlignment: (icon != null)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) icon ?? SizedBox.shrink(),
                  if (icon != null) SizedBox(width: 8),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: style ??
                        TextStyling.bold
                            .copyWith(color: textColor ?? context.appColorTheme().background, fontSize: 14.sp),
                  ),
                  if (icon != null)
                    SizedBox(
                      height: 24,
                      width: 24,
                    ),
                  if (icon != null) SizedBox(width: 8),
                ],
              ),
      ),
    );
  }
}

class SmallBtn extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isPrimary;
  final Color? textColor;
  const SmallBtn(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isPrimary = true,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: isPrimary ? context.appColorTheme().primary : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        padding:
            isPrimary ? EdgeInsets.fromLTRB(20, 8, 20, 8) : EdgeInsets.zero,
        child: Text(
          title,
          style: TextStyling.regular.copyWith(
              color:
                  textColor ?? (isPrimary ? context.appColorTheme().primary : context.appColorTheme().secondary), fontSize: 12.sp),
        ),
      ),
    );
  }
}
