import 'package:flutter/material.dart';

class MyConstant {
  //Field
  static Color primary = Color.fromARGB(255, 144, 79, 170);
  static Color dark = const Color.fromARGB(255, 26, 26, 66);
  static Color colbut = Color.fromARGB(255, 127, 63, 152);

  //Method

  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.0,
        center: const Alignment(-0.3, -0.3),
        colors: [Colors.white, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle customStyle() {
    return  TextStyle(
        fontSize: 24,
        color: Color.fromRGBO(127, 63, 152, 1),
        fontWeight: FontWeight.w700,
      );
    }
}
