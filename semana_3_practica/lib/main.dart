import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana_3_practica/counter_page.dart';
import 'package:semana_3_practica/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counterprovider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo setState vs Provider',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: const CounterPage(),
    );
  }
}
