import 'package:flutter/material.dart';
import 'package:music_app/theme/dark.dart';
import 'package:music_app/theme/light.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themedata => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themedata(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggletheme() {
    if (_themeData == lightmode) {
      themedata = darkmode;
    } else {
      themedata = lightmode;
    }
  }
}
