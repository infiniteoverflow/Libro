import 'package:flutter/material.dart';
class Styles{
  //colors
  static Color scaffoldColor = Color(0xffFFFFFF);
  static Color textField = Color(0x42000000);
  static Color textFieldBorder = Color(0x42000000).withOpacity(0.05);
  static MaterialColor colorCustom = MaterialColor(0xff00B0FF, color);
  //primary swatch color
  static Map<int, Color> color =
  {
    50:Color.fromRGBO(0, 176, 255,.1),
    100:Color.fromRGBO(0, 176, 255,.2),
    200:Color.fromRGBO(0, 176, 255,.3),
    300:Color.fromRGBO(0, 176, 255,.4),
    400:Color.fromRGBO(0, 176, 255,.5),
    500:Color.fromRGBO(0, 176, 255,.6),
    600:Color.fromRGBO(0, 176, 255,.7),
    700:Color.fromRGBO(0, 176, 255,.8),
    800:Color.fromRGBO(0, 176, 255,.9),
    900:Color.fromRGBO(0, 176, 255,1),
  };

//for textStyles in the app
  static TextStyle button(){
    return TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Styles.scaffoldColor,
    );
  }
  }