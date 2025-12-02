/*
import 'package:flutter/material.dart';
import 'package:rutas_actividad/screens/details_screen.dart';
import 'package:rutas_actividad/screens/home_screen.dart';
import 'package:rutas_actividad/screens/settings_screen.dart';

class AppRoutes {
  static const String home = 'home';
  static const String details = 'details';
  static const String settings = 'settings';
  //mas variables . . .

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomeScreen(),
      details: (context) => const DetailsScreen(),
      settings: (context) => const SettingsScreen(),
      // instancial el widget
    };
  }
}
*/

import 'package:go_router/go_router.dart';
import 'package:rutas_actividad/screens/details_screen.dart';
import 'package:rutas_actividad/screens/form_screen.dart';
import 'package:rutas_actividad/screens/home_screen.dart';
import 'package:rutas_actividad/screens/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/details', builder: (context, state) => DetailsScreen()),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
      routes: [
        GoRoute(path: '/form', builder: (context, state) => FormScreen()),
      ],
    ),
  ],
);
