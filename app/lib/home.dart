import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/reporte.dart';
import 'package:app/busca.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late List<Widget> opciones;
  int opc = 0;

  @override
  void initState() {
    super.initState();
    // El orden importa: índice 0 = Reportar, índice 1 = Buscar
    opciones = [
      const Reporte(),
      const Busca(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        titleSpacing: 0.0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Image.asset(
          "assets/utb_logo_azul.png",
          height: 90, // ajusta según se vea mejor
          fit: BoxFit.contain,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(text: "Objetos "),
                  TextSpan(
                    text: "Perdidos",
                    style: TextStyle(color: Color(0xFF1D4ED8)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Reporta o busca objetos extraviados en el campus.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ActionCard(
                    badgeIcon: Icons.eco,
                    badgeText: "Nuevo Reporte",
                    title: "Reportar Objeto",
                    subtitle:
                        "Sube fotos y detalles de un objeto que encuentres.",
                    actionText: "Crear Reporte",
                    backgroundImage: const AssetImage("assets/onboarding1.jpg"),
                    onTap: () {
                      setState(() {
                        opc = 0; // índice de Reporte en opciones
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ActionCard(
                    badgeIcon: Icons.eco,
                    badgeText: "Búsqueda Rápida",
                    title: "Buscar Objeto",
                    subtitle:
                        "Navega por la base de datos de objetos encontrados",
                    actionText: "Buscar",
                    backgroundImage: const AssetImage("assets/onboarding2.jpg"),
                    onTap: () {
                      setState(() {
                        opc = 1; // índice de Busca en opciones
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: IndexedStack(index: opc, children: opciones),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.badgeIcon,
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.backgroundImage,
    required this.onTap,
    this.height = 260,
    this.borderRadius = 20,
    this.overlayOpacity = 0.55,
  });

  final IconData badgeIcon;
  final String badgeText;
  final String title;
  final String subtitle;
  final String actionText;
  final ImageProvider backgroundImage;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final double overlayOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(overlayOpacity * 0.6),
                        Colors.black.withOpacity(overlayOpacity),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(badgeIcon, size: 14, color: Colors.white),
                            const SizedBox(width: 6),
                            Text(
                              badgeText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                actionText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
