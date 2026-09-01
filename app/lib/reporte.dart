import 'dart:async';
import 'package:flutter/material.dart';

class Reporte extends StatelessWidget {
  const Reporte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/utb_logo_azul.png",
        ),
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
