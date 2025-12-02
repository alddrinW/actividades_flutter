import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 80, color: Colors.deepOrange),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                //Navigator.pop(context);
                context.go('/');
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
