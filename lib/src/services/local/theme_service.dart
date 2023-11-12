import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

// class ThemeService with ListenableServiceMixin {
//   static late SharedPreferences prefs;
//   ReactiveValue<ThemeMode> _appThemeMode = ReactiveValue<ThemeMode>(ThemeMode.light);
//
//   ThemeMode get appThemeMode => _appThemeMode.value;
//
//   final String _prefKey = "USER_THEME_MODE";
//   set appThemeMode(ThemeMode value) {
//     _appThemeMode.value = value;
//     notifyListeners();
//     _storeLocally();
//   }
//
//   ThemeService() {
//     listenToReactiveValues([_appThemeMode]);
//     _restoreDataFromLocal();
//   }
//
//   _storeLocally() async {
//     prefs.setInt(_prefKey, _appThemeMode.value.index);
//   }
//
//   _restoreDataFromLocal() async {
//     if (!prefs.containsKey(_prefKey)) return;
//     int index = prefs.getInt(_prefKey) ?? 0;
//     appThemeMode = ThemeMode.values[index];
//   }
// }
