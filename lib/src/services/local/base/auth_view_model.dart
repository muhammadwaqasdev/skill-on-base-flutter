import 'package:flutter/material.dart';
import 'package:skill_on_base/src/services/local/theme_service.dart';
import 'package:skill_on_base/src/styles/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/local/auth_service.dart';

mixin AuthViewModel on ReactiveViewModel {
  AuthService _authService = locator<AuthService>();

  AuthService get authService => _authService;
  // ThemeService _themeService = locator<ThemeService>();
  //
  // ThemeService get themeService => _themeService;

  // ColorScheme get theme => locator<ThemeService>().appThemeMode == ThemeMode.light ? AppColors.lightTheme : AppColors.darkTheme;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}