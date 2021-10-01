import 'package:flutter/material.dart';

import 'changeThemeSP.dart';

class ThemeChanger with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();

  var _themeMode = ThemeMode.light;

  ThemeChanger() {
    darkThemePreference.getTheme().then((value) {
      if (value)
        _themeMode = ThemeMode.dark;
      else
        _themeMode = ThemeMode.light;

      notifyListeners();
    });
  }

  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    _themeMode.index == 1
        ? darkThemePreference.setDarkTheme(false)
        : darkThemePreference.setDarkTheme(true);
    notifyListeners();
  }
}
