import 'package:flutter/material.dart';
import 'package:rutas_actividad/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter demo con rutas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4,
        ),
      ),
      //initialRoute: AppRoutes.home,
      //routes: AppRoutes.getRoutes(),
      routerConfig: appRouter,
    );
  }
}
