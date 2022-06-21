import 'package:flutter/material.dart';

class MyConstant {
  //Field
  static Color primary = const Color.fromARGB(255, 127, 63, 152);
  static Color dark = const Color.fromARGB(255, 26, 26, 66);

  //Method
  TextStyle h1Style(){
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style(){
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style(){
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }
}
