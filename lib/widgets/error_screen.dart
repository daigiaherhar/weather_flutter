import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/widgets/widgets.dart';

import '../core/theme/theme.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              message,
              style: GoogleFonts.roboto(
                fontSize: 54,
                color: AppColors.white,
                fontWeight: FontWeight.w100, // Thin = 100
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 44),
            ButtonTextWidget(
              text: WeatherString.btn_retry,
              ontap: () => print("23432"),
            ),
          ],
        ),
      ),
    );
  }
}
