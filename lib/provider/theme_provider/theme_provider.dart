

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider(){
    loadTheme();
  }

  Future<void> toggleTheme(bool isDark)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isDarkMode', isDark);
    _themeMode = isDark? ThemeMode.dark : ThemeMode.light;
    navBarColor();
    notifyListeners();
  }

  Future<void> loadTheme()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isDark = preferences.getBool('isDarkMode') ?? false;
    _themeMode = isDark? ThemeMode.dark : ThemeMode.light;
    navBarColor();
    notifyListeners();
  }

  Future<void> navBarColor()async{
    final isDark = _themeMode==ThemeMode.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isDark ? Color(0xFF1c1c1d) : Colors.white
      )
    );
  }


}