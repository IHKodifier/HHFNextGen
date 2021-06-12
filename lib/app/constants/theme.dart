import 'package:flutter/material.dart';
import 'app_colors.dart' as AppColors;

ThemeData globalTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: Colors.red[800],
    primaryColor: AppColors.primaryColor,
    primaryColorDark: Colors.teal,
    primaryColorLight: Colors.red[100],
    accentColor: Colors.red.shade100,
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.white));
