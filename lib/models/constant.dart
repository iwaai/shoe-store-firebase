import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xff212121);
const kbuttonColor = Color(0xff30106b);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kBackGroundColor = Color(0xFFe2e2e2);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xffff7643)],
);

const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xFFe2e2e2);
const kAnimationDuration = Duration(milliseconds: 200);

TextTheme textTheme = TextTheme(
  headlineLarge: GoogleFonts.roboto(
      fontSize: 93,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      color: kTextColor),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 58, fontWeight: FontWeight.w500, letterSpacing: -0.5),
  headlineSmall: GoogleFonts.poppins(fontSize: 47, fontWeight: FontWeight.bold),
  labelLarge: GoogleFonts.poppins(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelMedium: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  bodySmall: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
);
