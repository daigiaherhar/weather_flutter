import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/theme.dart';

class ButtonTextWidget extends StatelessWidget {
  ButtonTextWidget({super.key, this.text, this.ontap});

  final String? text;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.charcoalGray,
      borderRadius: BorderRadius.all(Radius.circular(2)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: ontap,
          radius: 3.5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(
              text ?? "",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
