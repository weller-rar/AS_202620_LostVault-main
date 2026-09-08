import 'package:flutter/material.dart';

class ObjetoPerdido {
  final ImageProvider imagen;
  final String nombre;
  final String estado;
  final String ubicacion;
  final String hallado;

  ObjetoPerdido({
    required this.imagen,
    required this.nombre,
    required this.estado,
    required this.ubicacion,
    required this.hallado,
  });
}

class Busca extends StatelessWidget {
  const Busca({Key? key}) : super(key: key);

  static final List<ObjetoPerdido> listaDeObjetos = [
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
    ObjetoPerdido(
      imagen: const AssetImage("bolso.jpeg"),
      nombre: "Bolso",
      estado: "Disponible",
      ubicacion: "Biblioteca",
      hallado: "18/05/2026",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Encontrados Recientemente",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Buscar: Ej. Llaves, Móvil",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: listaDeObjetos.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final objeto = listaDeObjetos[index];
                    return TarjetaEncontrado(
                      imagen: objeto.imagen,
                      nombre: objeto.nombre,
                      estado: objeto.estado,
                      ubicacion: objeto.ubicacion,
                      hallado: objeto.hallado,
                      onVerDetalles: () {},
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TarjetaEncontrado extends StatelessWidget {
  final ImageProvider imagen;
  final String nombre;
  final String estado; // ej: "Ubicación: Biblioteca"
  final String ubicacion; // ej: "Ubicación: Biblioteca Bloque B"
  final String hallado; // ej: "18/05/2026"
  final VoidCallback onVerDetalles;

  const TarjetaEncontrado({
    Key? key,
    required this.imagen,
    required this.nombre,
    required this.estado,
    required this.ubicacion,
    required this.hallado,
    required this.onVerDetalles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: imagen,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      estado,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            ubicacion,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            "Hallado: $hallado",
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onVerDetalles,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                "Ver Detalles",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
