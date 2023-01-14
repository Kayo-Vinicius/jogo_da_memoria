import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemaJogo {
  static const MaterialColor color = MaterialColor(
    corPrimaria,
    <int, Color>{
      50: Color(0xfffce4ec),
      100: Color(0xfff8bbd0),
      200: Color(0xfff48fb1),
      300: Color(0xfff06292),
      400: Color(0xffec407a),
      500: Color(corPrimaria),
      600: Color(0xffd81b60),
      700: Color(0xffc2185b),
      800: Color(0xffad1457),
      900: Color(0xff880e4f),
    },
  );
  static const int corPrimaria = 0xffff1d87;
  static const Color corFundo = Color(0xff121212);

  static ButtonStyle estiloBotao({
    Color color = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: color, 
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: color),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
    );
  }

  static ThemeData tema = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: corFundo,
    primarySwatch: color,
    primaryColor: color,
    textTheme: GoogleFonts.wendyOneTextTheme(
      ThemeData.dark().textTheme,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: estiloBotao(),
    ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.wendyOne(fontSize: 25),
          centerTitle: true,
        ),
  );
}
