import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Reporte extends StatefulWidget {
  const Reporte({Key? key}) : super(key: key);
  @override
  State<Reporte> createState() => _Reporte();
}

class _Reporte extends State<Reporte> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _ubicacionController = TextEditingController();

  String? _categoriaSeleccionada;
  File? _imagenSeleccionada;

  final List<String> _categorias = [
    "Electrónicos",
    "Ropa y accesorios",
    "Llaves",
    "Documentos",
    "Botellas / Termos",
    "Otro",
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _ubicacionController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarImagen(ImageSource fuente) async {
    final XFile? imagen = await _picker.pickImage(
      source: fuente,
      imageQuality: 80,
    );
    if (imagen != null) {
      setState(() {
        _imagenSeleccionada = File(imagen.path);
      });
    }
  }

  void _mostrarOpcionesImagen() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Tomar foto"),
                onTap: () {
                  Navigator.pop(context);
                  _seleccionarImagen(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Elegir de galería"),
                onTap: () {
                  Navigator.pop(context);
                  _seleccionarImagen(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _enviarReporte() {
    if (_formKey.currentState!.validate()) {
      if (_imagenSeleccionada == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Agrega una foto del objeto")),
        );
        return;
      }

      // Aquí luego conectarás con tu backend / base de datos
      final reporte = {
        "nombre": _nombreController.text,
        "descripcion": _descripcionController.text,
        "ubicacion": _ubicacionController.text,
        "categoria": _categoriaSeleccionada,
        "imagen": _imagenSeleccionada!.path,
      };

      debugPrint("Reporte enviado: $reporte");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Reporte enviado correctamente ✅")),
      );

      _limpiarFormulario();
    }
  }

  void _limpiarFormulario() {
    _nombreController.clear();
    _descripcionController.clear();
    _ubicacionController.clear();
    setState(() {
      _categoriaSeleccionada = null;
      _imagenSeleccionada = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reportar Objeto",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Completa los datos del objeto encontrado o perdido.",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // Selector de imagen
            GestureDetector(
              onTap: _mostrarOpcionesImagen,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: _imagenSeleccionada == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo,
                              size: 36, color: Colors.grey[500]),
                          const SizedBox(height: 8),
                          Text(
                            "Toca para subir una foto",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          _imagenSeleccionada!,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),

            // Nombre del objeto
            const Text("Nombre del objeto",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _nombreController,
              decoration: _inputDecoration("Ej. Llaves con llavero"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Categoría
            const Text("Categoría",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _categoriaSeleccionada,
              decoration: _inputDecoration("Selecciona una categoría"),
              items: _categorias
                  .map((categoria) => DropdownMenuItem(
                        value: categoria,
                        child: Text(categoria),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _categoriaSeleccionada = value;
                });
              },
              validator: (value) =>
                  value == null ? "Selecciona una categoría" : null,
            ),
            const SizedBox(height: 16),

            // Ubicación
            const Text("Ubicación donde se encontró",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _ubicacionController,
              decoration: _inputDecoration("Ej. Biblioteca, Bloque B"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Descripción
            const Text("Descripción",
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _descripcionController,
              maxLines: 3,
              decoration:
                  _inputDecoration("Añade detalles que ayuden a identificarlo"),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Botón enviar
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _enviarReporte,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4ED8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Crear Reporte",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1D4ED8), width: 1.5),
      ),
    );
  }
}
