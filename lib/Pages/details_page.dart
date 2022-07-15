import 'package:appcompass/custom/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DetailsPage extends StatelessWidget {
  Map<String, dynamic> bancos;
  DetailsPage({Key? key, required this.bancos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 109, 187, 144), Colors.blueGrey]),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradienteColorsDetailsPage()),
        padding: EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.all(16)),
          Container(
            color: CustomColors().getPrimaryButtonColor(),
            child: ListTile(
              title: Text(
                  style: TextStyle(color: Colors.white),
                  'Nome: ' + bancos['fullName']),
            ),
          ),
          Container(
            color: CustomColors().getPrimaryButtonColor(),
            child: ListTile(
              title: Text(
                  style: TextStyle(color: Colors.white),
                  'Identificador de Sistema de Pagamentos Brasileiro(ISPB): ' +
                      bancos['ispb'].toString()),
            ),
          ),
          Container(
            color: CustomColors().getPrimaryButtonColor(),
            child: ListTile(
              title: Text(
                  style: TextStyle(color: Colors.white),
                  'Código: ' + bancos['code'].toString()),
            ),
          ),
        ]),
      ),
    );
  }
}
