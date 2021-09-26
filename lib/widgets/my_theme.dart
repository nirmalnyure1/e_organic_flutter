import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.white,
          titleTextStyle: TextStyle(
              color: MyTheme.darkBluishColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: GoogleFonts.lato().fontFamily,
              letterSpacing: 4),
          iconTheme: IconThemeData(color: MyTheme.darkBluishColor),
          centerTitle: true,
        ),

        fontFamily: GoogleFonts.lato().fontFamily,
        //fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        cardColor: Colors.black,
        canvasColor: dark,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
        ),
      );

//Colors
  static Color creamColor = Colors.grey.shade100;
  static Color dark = Colors.grey;

  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Colors.blue.shade400;
  static Color mainColor = const Color(0x0000ff00);
  static Color green = Colors.green;
  static Color textColor = Colors.black45;
  static Color textColorgrey = Colors.grey;
  static Color whiteColor = Colors.white;
}
