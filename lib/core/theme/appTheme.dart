import 'package:flutter/material.dart';
import 'appColor.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkGreen),
      bodyMedium: TextStyle(color: AppColors.accent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
    dividerColor: AppColors.darkGreen.withOpacity(0.3),
  );
}
