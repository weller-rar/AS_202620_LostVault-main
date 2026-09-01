import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/home.dart';

class UtbSplashScreen extends StatefulWidget {
  const UtbSplashScreen({Key? key}) : super(key: key);

  @override
  State<UtbSplashScreen> createState() => _UtbSplashScreenState();
}

class _UtbSplashScreenState extends State<UtbSplashScreen> {
  @override
  void initState() {
    super.initState();

    // 🕒 Control del tiempo: Espera 3 segundos y luego cambia de pantalla
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0056B3), // Azul UTB
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo de la universidad (recuerda que debe estar en tu carpeta assets)
              Image(
                image: AssetImage('assets/utb_logo.png'),
                width: 220,
                color: Colors.white,
              ),
              SizedBox(height: 24),

              // Animación de los tres puntos
              SpinKitThreeBounce(
                color: Colors.white,
                size: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
