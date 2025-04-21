import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'pages/page4.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/page1/:name',
        builder: (context, state) {
          final name = state.pathParameters['name']!;
          return Page1(name: name);
        },
      ),
      GoRoute(
        path: '/page2/:age',
        builder: (context, state) {
          final age = int.parse(state.pathParameters['age']!);
          return Page2(age: age);
        },
      ),
      GoRoute(
        path: '/page3/:color',
        builder: (context, state) {
          final color = state.pathParameters['color']!;
          return Page3(color: color);
        },
      ),
      GoRoute(
        path: '/page4/:message',
        builder: (context, state) {
          final message = state.pathParameters['message']!;
          return Page4(message: message);
        },
      ),
    ],
  );
}
