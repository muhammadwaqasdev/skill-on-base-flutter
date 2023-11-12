import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_on_base/generated/local_keys.g.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/configs/go_router.dart';
import 'package:skill_on_base/src/services/local/theme_service.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked_themes/stacked_themes.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        lightTheme: ThemeData.from(colorScheme: AppColors.lightTheme, useMaterial3: true),
        darkTheme: ThemeData.from(colorScheme: AppColors.darkTheme, useMaterial3: true),
        builder: (context, theme, darkTheme, themeMode) {
        return ScreenUtilInit(
            designSize: Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, snap) {
              return MaterialApp.router(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                routerConfig: NewGoRoute.router,
                themeMode: themeMode,
                theme: theme,
                darkTheme: darkTheme,
                // theme: ThemeData.from(colorScheme: AppColors.lightTheme, useMaterial3: true),
                // darkTheme: ThemeData.from(colorScheme: AppColors.darkTheme, useMaterial3: true),
                builder: (context, child) {
                  return Stack(
                    children: [child!],
                  );
                },
              );
            });
      }
    );
  }
}


