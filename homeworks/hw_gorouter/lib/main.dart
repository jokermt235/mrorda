import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './pages/home_page.dart';
import './pages/page_1.dart';
import './pages/page_2.dart';
import './pages/page_3.dart';
import './pages/page_4.dart';

void main() {
  runApp(MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/page1/:name',
      builder: (context, state) => Page1(name: state.pathParameters['name']!),
    ),
    GoRoute(
      path: '/page2/:age',
      builder:
          (context, state) =>
              Page2(age: int.parse(state.pathParameters['age']!)),
    ),
    GoRoute(
      path: '/page3/:city',
      builder: (context, state) => Page3(city: state.pathParameters['city']!),
    ),
    GoRoute(
      path: '/page4',
      builder: (context, state) => Page4(extraMessage: state.extra as String?),
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
