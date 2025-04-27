import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_bloc_app/book_viewer.dart';
import 'package:multi_bloc_app/username_duplicator.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'page1/:param1',
          builder: (context, state) => Page1(
            param1: state.pathParameters['param1']!,
          ),
        ),
        GoRoute(
          path: 'page2',
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            return Page2(
              param2: extra?['param2'] ?? 'No param',
              param3: extra?['param3'] ?? 0,
            );
          },
        ),
        GoRoute(
          path: 'page3',
          builder: (context, state) {
            final queryParams = state.uri.queryParameters;
            return Page3(
              param4: queryParams['param4'] ?? 'No param',
              param5: queryParams['param5'] ?? 'No param',
            );
          },
        ),
        GoRoute(
          path: 'page4',
          builder: (context, state) => const Page4(),
        ),
        GoRoute(
          path: 'page5',
          builder: (context, state) => const Page5(),
        ),
        GoRoute(
          path: 'book',
          builder: (context, state) => BookViewer(
            pages: const [
              'Page 1 content',
              'Page 2 content',
              'Page 3 content',
              'Final page content',
            ],
          ),
        ),
      ],
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/page1/hello'),
              child: const Text('Go to Page 1 (path param)'),
            ),
            ElevatedButton(
              onPressed: () => context.go(
                '/page2',
                extra: {'param2': 'from extra', 'param3': 42},
              ),
              child: const Text('Go to Page 2 (extra param)'),
            ),
            ElevatedButton(
              onPressed: () => context.go(
                '/page3?param4=query1&param5=query2',
              ),
              child: const Text('Go to Page 3 (query params)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page4'),
              child: const Text('Go to Page 4'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page5'),
              child: const Text('Go to Page 5'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/book'),
              child: const Text('View Book'),
            ),
            const SizedBox(height: 20),
            const UsernameDuplicator(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String param1;

  const Page1({super.key, required this.param1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Text('Received param: $param1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String param2;
  final int param3;

  const Page2({super.key, required this.param2, required this.param3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received param2: $param2'),
            Text('Received param3: $param3'),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String param4;
  final String param5;

  const Page3({super.key, required this.param4, required this.param5});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received param4: $param4'),
            Text('Received param5: $param5'),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: const Center(
        child: Text('This is Page 4'),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: const Center(
        child: Text('This is Page 5'),
      ),
    );
  }
}