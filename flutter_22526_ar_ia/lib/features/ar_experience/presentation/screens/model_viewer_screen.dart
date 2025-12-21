import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatelessWidget {
  const ModelViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Model Viewer (Web/Android/iOS)')),
      body: const Center(
        child: ModelViewer(
          src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          backgroundColor: Color.fromARGB(255, 234, 234, 239),
          autoRotate: true,
          cameraControls: true,
          // habilitar el boton para ver el modelo en el AR
          ar: true,

          alt: 'Texto alternativo si no existe el archivo',
        ),
      ),
    );
  }
}
