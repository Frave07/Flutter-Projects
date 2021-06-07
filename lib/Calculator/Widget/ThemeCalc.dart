

import 'package:flutter/material.dart';

class CalculatorTheme
{
    static final darkTheme = ThemeData.dark().copyWith(
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff22252d),
      backgroundColor: Color(0xff292d36),
      primaryColor: Color(0xff272b36),
      canvasColor: Colors.white
    );

    static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Color(0xfff9f9f9),
      primaryColor: Color(0xfff7f7f7),
      canvasColor: Colors.black87
    );
}