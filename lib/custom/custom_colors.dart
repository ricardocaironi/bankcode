import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButtonColor = Color.fromRGBO(50, 61, 75, 2);
  Color _activeSecondButtonColor = Color.fromARGB(255, 109, 76, 170);
  Color _activeListTileColor = Color.fromARGB(255, 55, 109, 97);

  Color getPrimaryButtonColor() {
    return _activePrimaryButtonColor;
  }

  Color getSecondButtonColor() {
    return _activePrimaryButtonColor;
  }

  Color getDetailListTileColor() {
    return _activeListTileColor;
  }
}

gradienteColorsLogin() {
  Color topColor = Color.fromRGBO(50, 61, 75, 2);
  Color bottomColor = Color.fromARGB(255, 116, 191, 170);

  return LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
      // ignore: prefer_const_literals_to_create_immutables
      stops: [
        0.35,
        1,
      ], colors: [
    topColor,
    bottomColor,
  ]);
}

gradienteColorsSignUp() {
  Color topColor = Color.fromRGBO(50, 61, 75, 2);
  Color bottomColor = Color.fromARGB(255, 116, 191, 170);

  return LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft,
      // ignore: prefer_const_literals_to_create_immutables
      stops: [
        0.1,
        25,
      ], colors: [
    topColor,
    bottomColor,
  ]);
}

gradienteColorsDetailsPage() {
  Color topColor = Color.fromRGBO(50, 61, 75, 2);
  Color bottomColor = Color.fromARGB(255, 169, 219, 205);

  return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
      // ignore: prefer_const_literals_to_create_immutables
      stops: [
        0.1,
        25,
      ], colors: [
    bottomColor,
    topColor,
  ]);
}
