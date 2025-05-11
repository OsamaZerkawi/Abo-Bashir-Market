import 'package:abo_bashir_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle kButtonTextStyle(BuildContext context) {
  // return GoogleFonts.notoKufiArabic(
  //   fontSize: MediaQuery.of(context).size.width * 0.045,
  //   fontWeight: FontWeight.w600,
  //   color: Colors.white,
  // );

  return TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.045,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

// Responsive Text Styles
TextStyle kHeadingStyle(BuildContext context) {
  // return GoogleFonts.notoKufiArabic(
  //   fontSize: MediaQuery.of(context).size.width * 0.07, // Responsive font
  //   fontWeight: FontWeight.bold,
  //   color: kPrimaryColor,
  // );
  return TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.07, // Responsive font
    fontWeight: FontWeight.bold,
    // color: AppColors.primaryColor,
  );
}

TextStyle kLabelStyle(BuildContext context) {
  // return GoogleFonts.notoKufiArabic(
  //   fontSize: MediaQuery.of(context).size.width * 0.04,
  //   fontWeight: FontWeight.bold,
  // );

  return TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.bold,
  );
}


TextStyle kSubtitleStyle(BuildContext context) {
  // return GoogleFonts.notoKufiArabic(
  //   fontSize: MediaQuery.of(context).size.width * 0.045,
  //   color: Colors.grey[700],
  // );

  return TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.045,
    color: Colors.grey[700],
  );
}
