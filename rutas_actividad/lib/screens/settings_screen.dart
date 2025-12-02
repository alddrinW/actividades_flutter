import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rutas_actividad/screens/form_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _returnedData = 'Sin datos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'Valor retornado: $_returnedData',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormScreen()),
                );
                if (result != null) {
                  setState(() {
                    _returnedData = result;
                  });
                }
              },
              label: Text('Abrir Formulario'),
              icon: Icon(Icons.input),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //Navigator.pop(context);
                context.go('/');
              },
              label: Text('Regresar'),
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
