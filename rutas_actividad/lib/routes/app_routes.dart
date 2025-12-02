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
