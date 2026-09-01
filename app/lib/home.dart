import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/utb_logo_azul.png",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Objetos Perdidos"),
          Text("Reporta o busca ojetos extraviados en el campus"),
          Row(
            children: [
              IconButton(onPressed: () => {}, icon: Text("hola1")),
              IconButton(onPressed: () => {}, icon: Text("hola2")),
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }
}
