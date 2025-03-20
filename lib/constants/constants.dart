import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary color for branding
const Color kPrimaryColor = Color(0xff5BE15F);
const Color kHintTextColor = Color.fromARGB(255, 176, 164, 164);

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
    color: kPrimaryColor,
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

TextStyle kLinkStyle(BuildContext context) {
  // return GoogleFonts.notoKufiArabic(
  //   fontSize: MediaQuery.of(context).size.width * 0.04,
  //   fontWeight: FontWeight.w600,
  //   color: kPrimaryColor,
  // );
  return TextStyle(
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.w600,
    color: kPrimaryColor,
  );
}

// Spacing
const double kPadding = 16.0;
