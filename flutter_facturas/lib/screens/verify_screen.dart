import 'package:flutter/material.dart';
import '../models/invoice_data.dart';

class VerifyScreen extends StatefulWidget {
  final InvoiceData invoice;

  VerifyScreen({required this.invoice});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  late TextEditingController fechaCtrl;
  late TextEditingController totalCtrl;
  late TextEditingController codigoCtrl;

  @override
  void initState() {
    super.initState();
    fechaCtrl = TextEditingController(text: widget.invoice.fecha ?? '');
    totalCtrl = TextEditingController(text: widget.invoice.total ?? '');
    codigoCtrl =
        TextEditingController(text: widget.invoice.codigoFactura ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificar Datos')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: fechaCtrl,
              decoration: InputDecoration(labelText: 'Fecha de Emisión'),
            ),
            TextFormField(
              controller: totalCtrl,
              decoration: InputDecoration(labelText: 'Monto Total'),
            ),
            TextFormField(
              controller: codigoCtrl,
              decoration: InputDecoration(labelText: 'Código de Factura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
