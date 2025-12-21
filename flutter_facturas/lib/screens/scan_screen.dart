import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../utils/invoice_parser.dart';
import 'verify_screen.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool loading = false;

  Future<void> scan(ImageSource source) async {
    setState(() => loading = true);

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      setState(() => loading = false);
      return;
    }

    final inputImage = InputImage.fromFile(File(pickedFile.path));
    final textRecognizer =
        TextRecognizer(script: TextRecognitionScript.latin);

    final recognizedText = await textRecognizer.processImage(inputImage);
    textRecognizer.close();

    final invoice = InvoiceParser.parse(recognizedText.text);

    setState(() => loading = false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VerifyScreen(invoice: invoice),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Scanning OCR')),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => scan(ImageSource.camera),
                    child: Text('Escanear con Cámara'),
                  ),
                  ElevatedButton(
                    onPressed: () => scan(ImageSource.gallery),
                    child: Text('Seleccionar de Galería'),
                  ),
                ],
              ),
      ),
    );
  }
}
