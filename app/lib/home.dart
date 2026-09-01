import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/reporte.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        titleSpacing: 0.0,
        title: Image.asset(
          "assets/utb_logo_azul.png",
          width: 120.0,
          height: 70.0,
          fit: BoxFit.cover,
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
            SizedBox(
              width: 5,
              height: 5,
            ),
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
                    backgroundImage: AssetImage("assets/onboarding1.jpg"),
                    onTap: () => {},
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                Expanded(
                  child: ActionCard(
                    badgeIcon: Icons.eco,
                    badgeText: "Búsqueda Rápida",
                    title: "Buscar Objeto",
                    subtitle:
                        "Navega por la base de datos de objetos encontrados",
                    actionText: "Buscar",
                    backgroundImage: AssetImage("assets/onboarding2.jpg"),
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            SizedBox()
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

  /// Ícono que aparece dentro del badge superior.
  final IconData badgeIcon;

  /// Texto del badge superior (ej. "Nuevo Reporte").
  final String badgeText;

  /// Título grande en el medio de la tarjeta.
  final String title;

  /// Texto descriptivo debajo del título.
  final String subtitle;

  /// Texto junto a la flecha en la parte inferior (ej. "Crear Reporte").
  final String actionText;

  /// Imagen de fondo. Puede ser AssetImage, NetworkImage, etc.
  final ImageProvider backgroundImage;

  /// Acción a ejecutar al tocar la tarjeta (navegación, callback, etc.).
  final VoidCallback onTap;

  /// Alto de la tarjeta.
  final double height;

  /// Radio de las esquinas.
  final double borderRadius;

  /// Opacidad de la capa oscura sobre la imagen (0.0 - 1.0).
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
                // Imagen de fondo
                Image(
                  image: backgroundImage,
                  fit: BoxFit.cover,
                ),
                // Capa oscura para legibilidad del texto
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
                // Contenido
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Badge superior
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

                      // Título y subtítulo
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
                          // Acción con flecha
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
