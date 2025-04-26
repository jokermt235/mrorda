import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: '/page2/:username',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        return Page2(username: username);
      },
    ),
    GoRoute(
      path: '/page3/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return Page3(id: id);
      },
    ),
    GoRoute(
      path: '/page4/:city',
      builder: (context, state) {
        final city = state.pathParameters['city']!;
        return Page4(city: city);
      },
    ),
    GoRoute(
      path: '/page5/:message',
      builder: (context, state) {
        final message = state.pathParameters['message']!;
        return Page5(message: message);
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
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/page2/JohnDoe');
          },
          child: const Text('Go to Page 2 with username'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String username;
  const Page2({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, $username'),
            ElevatedButton(
              onPressed: () {
                context.go('/page3/42');
              },
              child: const Text('Go to Page 3 with ID'),
            )
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String id;
  const Page3({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            ElevatedButton(
              onPressed: () {
                context.go('/page4/London');
              },
              child: const Text('Go to Page 4 with city'),
            )
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  final String city;
  const Page4({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to $city'),
            ElevatedButton(
              onPressed: () {
                context.go('/page5/Success');
              },
              child: const Text('Go to Page 5 with message'),
            )
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  final String message;
  const Page5({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: Center(
        child: Text('Final message: $message'),
      ),
    );
  }
}
