import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 80, color: Colors.amber),
            Text('Bienvenido', style: TextStyle(fontSize: 24)),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                //Navigator.pushNamed(context, 'details');
                context.go('/details');
              },
              label: Text('Ir a detalles'),
              icon: Icon(Icons.info),
            ),

            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                //Navigator.pushNamed(context, 'settings');
                context.go('/settings');
              },
              label: Text('Ir a settings'),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
