import 'package:flutter/material.dart';
import 'package:weather/core/theme/theme.dart';

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.background,

    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Roboto",
        fontSize: 96,
        color: AppColors.black,
        fontWeight: FontWeight.w900,
        letterSpacing: 0,
        height: 1.2,
      ),

      displayMedium: TextStyle(
        fontFamily: "Roboto",
        fontSize: 36,
        color: AppColors.steelBlue,
        fontWeight: FontWeight.w100,
        letterSpacing: 0,
        height: 1.4,
      ),
      displaySmall: TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w400, // Regular = 400
        letterSpacing: 0,
        height: 1.2,
      ),
    ),
  );

  // static final dark = ThemeData(
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: AppColors.background,
  //
  //   textTheme: TextTheme(
  //     bodyLarge: GoogleFonts.telex(color: Colors.white),
  //     bodyMedium: GoogleFonts.telex(color: Colors.white),
  //   ),
  // );
}
