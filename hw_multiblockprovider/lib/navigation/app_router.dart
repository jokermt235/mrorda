import 'package:flutter/material.dart';
import '../features/counter/counter_screen.dart';
import '../features/theme/theme_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    '/counter': (context) => const CounterScreen(),
    '/theme': (context) => const ThemeScreen(),
  };
}