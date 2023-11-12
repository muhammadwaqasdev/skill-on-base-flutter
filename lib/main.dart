import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_on_base/src/app/app_view.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/local/auth_service.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ThemeManager.initialise();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AuthService.prefs = await SharedPreferences.getInstance();
  // ThemeService.prefs = await SharedPreferences.getInstance();

  setupLocator();


  runApp(
    EasyLocalization(
        supportedLocales: Constants.supportedLocales,
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        useOnlyLangCode: true,
        child: AppView()
    ),
  );
}
