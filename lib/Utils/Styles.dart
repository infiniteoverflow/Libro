import 'package:flutter/material.dart';

class Styles {
  //colors
  static Color scaffoldColor = const Color(0xffFFFFFF);
  static Color textField = const Color(0x42000000);
  static Color textFieldBorder = const Color(0x42000000).withOpacity(0.05);
  static MaterialColor colorCustom = MaterialColor(0xff00B0FF, color);
  static Color profileBar = const Color(0xFF343EDB);
  static Color headingColor = const Color(0xFF38475B);
  static Color shadowColor = const Color(0X95E9EBF0);
  //primary swatch color
  static Map<int, Color> color = {
    50: const Color.fromRGBO(0, 176, 255, .1),
    100: const Color.fromRGBO(0, 176, 255, .2),
    200: const Color.fromRGBO(0, 176, 255, .3),
    300: const Color.fromRGBO(0, 176, 255, .4),
    400: const Color.fromRGBO(0, 176, 255, .5),
    500: const Color.fromRGBO(0, 176, 255, .6),
    600: const Color.fromRGBO(0, 176, 255, .7),
    700: const Color.fromRGBO(0, 176, 255, .8),
    800: const Color.fromRGBO(0, 176, 255, .9),
    900: const Color.fromRGBO(0, 176, 255, 1),
  };

//for textStyles in the app
  static TextStyle button() {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: Styles.scaffoldColor,
    );
  }
}
