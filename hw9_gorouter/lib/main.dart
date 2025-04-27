import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw9_gorouter/pages/home_page.dart';
import 'package:hw9_gorouter/pages/page_screen.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/page1/:message',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'No message';
        return PageScreen(title: 'Page 1', message: message);
      },
    ),
    GoRoute(
      path: '/page2/:message',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'No message';
        return PageScreen(title: 'Page 2', message: message);
      },
    ),
    GoRoute(
      path: '/page3/:message',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'No message';
        return PageScreen(title: 'Page 3', message: message);
      },
    ),
    GoRoute(
      path: '/page4/:message',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'No message';
        return PageScreen(title: 'Page 4', message: message);
      },
    ),
    GoRoute(
      path: '/page5/:message',
      builder: (context, state) {
        final message = state.pathParameters['message'] ?? 'No message';
        return PageScreen(title: 'Page 5', message: message);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'GoRouter Example',
    );
  }
}
