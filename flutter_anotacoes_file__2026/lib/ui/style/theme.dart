import 'package:flutter/material.dart';
import '/ui/style/colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.p4,
    primaryColor: AppColors.p1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.p1,
      foregroundColor: AppColors.p4,
      titleTextStyle: TextStyle(
        fontFamily: 'PatrickHand',
        color: AppColors.p4,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.p3,
        fontSize: 16,
        fontFamily: 'PatrickHand',
      ),
      displayMedium: TextStyle(
        color: AppColors.p3,
        fontSize: 16,
        fontFamily: 'PatrickHand',
      ),
      labelMedium: TextStyle(
        color: AppColors.p3,
        fontSize: 16,
        fontFamily: 'PatrickHand',
      ),
      titleMedium: TextStyle(
        color: AppColors.p3,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.p2,
        foregroundColor: AppColors.p4,
        textStyle: TextStyle(
          fontFamily: 'PatrickHand',
          fontSize: 20,
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
