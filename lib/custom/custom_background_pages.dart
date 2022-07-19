import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Text(
      "Bank Code",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromARGB(255, 109, 76, 170),
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ImageLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      child: Image.asset(
        'assets/img/bankcode.png',
        height: 180,
        width: 170,
      ),
    );
  }
}



