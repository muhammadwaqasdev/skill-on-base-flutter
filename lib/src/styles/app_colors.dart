import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/local/base/auth_view_model.dart';
import 'package:skill_on_base/src/services/local/theme_service.dart';

class AppColors {
  AppColors._();

  static ColorScheme lightTheme = ColorScheme(
    brightness: Brightness.light,
    primary: HexColor("#00455B"),
    onPrimary: HexColor("#66A4B7"),
    primaryContainer: HexColor("#007093"),
    onPrimaryContainer: HexColor("#84E2FF"),
    secondary: HexColor("#53EA6B"),
    onSecondary: HexColor("#0C6C1B"),
    secondaryContainer: HexColor("#18BDB3"),
    onSecondaryContainer: HexColor("#0A504C"),
    tertiary: HexColor("#ABABAB"),
    onTertiary: HexColor("#303030"),
    tertiaryContainer: HexColor("#6E6E6E"),
    onTertiaryContainer: HexColor("#D1D1D1"),
    error: HexColor("#D70000"),
    onError: HexColor("#FFB7B7"),
    errorContainer: HexColor("#FFD9D9"),
    onErrorContainer: HexColor("#9C0000"),
    background: HexColor("#FAFAFA"),
    onBackground: HexColor("#494949"),
    surface: HexColor("#FFFFFF"),
    onSurface: HexColor("#171717"),
    surfaceVariant: HexColor("#DEDEDE"),
    onSurfaceVariant: HexColor("#CACACA"),
    outline: HexColor("#ECECEC"),
    inverseSurface: HexColor("#000000"),
    onInverseSurface: HexColor("#DCDCDC"),
    inversePrimary: HexColor("#01506A"),
    surfaceTint: HexColor("#E6FDF9"),
  );

  static ColorScheme darkTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: HexColor("#66A4B7"),
    onPrimary: HexColor("#00455B"),
    primaryContainer: HexColor("#25C7FA"),
    onPrimaryContainer: HexColor("#007093"),
    secondary: HexColor("#0C6C1B"),
    onSecondary: HexColor("#53EA6B"),
    secondaryContainer: HexColor("#0A504C"),
    onSecondaryContainer: HexColor("#18BDB3"),
    tertiary: HexColor("#ABABAB"),
    onTertiary: HexColor("#303030"),
    tertiaryContainer: HexColor("#6E6E6E"),
    onTertiaryContainer: HexColor("#D1D1D1"),
    error: HexColor("#D70000"),
    onError: HexColor("#FFB7B7"),
    errorContainer: HexColor("#FFD9D9"),
    onErrorContainer: HexColor("#9C0000"),
    background: HexColor("#1B1B1B"),
    onBackground: HexColor("#E7E7E7"),
    surface: HexColor("#3F3F3F"),
    onSurface: HexColor("#898989"),
    surfaceVariant: HexColor("#616161"),
    onSurfaceVariant: HexColor("#CACACA"),
    outline: HexColor("#484848"),
    inverseSurface: HexColor("#A3A3A3"),
    onInverseSurface: HexColor("#434343"),
    inversePrimary: HexColor("#01506A"),
    surfaceTint: HexColor("#515E5B"),
  );

  // static ColorScheme theme =
  //     mainContext == null ? Theme.of(mainContext!).colorScheme : lightTheme;

  // static HexColor black = HexColor("#000000");
  // static HexColor white = HexColor("#ffffff");
  // static HexColor peach = HexColor("#FCEFDA");
  // static HexColor yellow = HexColor("#FFDB45");
  // static HexColor purple = HexColor("#743FA9");
  // static HexColor green = HexColor("#41BD6F");
}
