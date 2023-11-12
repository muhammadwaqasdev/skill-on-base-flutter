import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:stacked_themes/stacked_themes.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Decoration? backgroundDecoration;
  final EdgeInsetsGeometry? padding;
  final double? topPadding;

  const CustomScaffold(
      {Key? key,
      required this.body,
      this.backgroundDecoration,
      this.padding,
      this.topPadding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getThemeManager(context).isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: backgroundDecoration,
          padding: padding?.add(
                EdgeInsets.only(
                  top: topPadding ?? MediaQuery.of(context).padding.top,
                ),
              ) ??
              EdgeInsets.fromLTRB(
                  20, topPadding ?? MediaQuery.of(context).padding.top, 20, 20),
          width: context.screenSize().width,
          height: context.screenSize().height,
          child: Stack(
            children: [
              body,
              // Switch(value: getThemeManager(context).isDarkMode, onChanged: (v){
              //   getThemeManager(context)
              //       .toggleDarkLightTheme();
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
