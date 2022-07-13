// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
    
  static Color orange = Colors.orange;
  static Color grey = Colors.grey;
  static Color primary = Color(0xFFE7ECEF);
  static Color primaryDark = Colors.grey.shade900;

  static List<BoxShadow> shadownCard = [
    BoxShadow(
      blurRadius: 5,
      offset: Offset(-3, -3),
      color: Colors.white
    ),
    BoxShadow(
      blurRadius: 5,
      offset: Offset(5, 5),
      color: Color(0xFFA7A9AF)
    )
  ];

  // static List<BoxShadow> shadownCardDark = [
  //   BoxShadow(
  //     blurRadius: 5,
  //     offset: Offset(-3, -3),
  //     color: Colors.red
  //   ),
  //   BoxShadow(
  //     blurRadius: 5,
  //     offset: Offset(5, 5),
  //     color: Color(0xFFA7A9AF)
  //   )
  // ];

  static ThemeData theme = ThemeData(
    fontFamily: 'RobotoMono',
    backgroundColor: primary,
    scaffoldBackgroundColor: primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orange,
      foregroundColor: primary,
    ),
    

    textTheme: TextTheme(
      titleSmall: TextStyle(fontWeight: FontWeight.bold),
      labelSmall: TextStyle(fontSize: 17, color: Colors.orange)

    )
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'RobotoMono',
    backgroundColor:  primaryDark,
    scaffoldBackgroundColor: primaryDark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orange,
      foregroundColor: primary,
    ),
  );
}

