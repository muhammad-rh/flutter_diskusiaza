import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DataState { loading, filled, error }

const Color primaryColor = Color(0xFF26747E);
const Color successColor = Color(0xFF36a5b2);
const Color infoColor = Color(0xFF007ADD);
const Color backgroundPrimaryColor = Color(0xFFCCE4F8);

TextStyle poppinsExLight(double size, Color color) => GoogleFonts.poppins(
      fontWeight: FontWeight.w200,
      fontSize: size,
      color: color,
    );

TextStyle poppinsLight(double size, Color color) => GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: size,
      color: color,
    );

TextStyle poppinsRegular(double size, Color color) => GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      fontSize: size,
      color: color,
    );

TextStyle poppinsMedium(double size, Color color) => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: size,
      color: color,
    );

TextStyle poppinsBold(double size, Color color) => GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color,
    );
