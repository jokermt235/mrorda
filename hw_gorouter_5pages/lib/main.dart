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
      routes: [
        GoRoute(
          path: 'page2/:message',
          builder:
              (context, state) =>
                  Page2(message: state.pathParameters['message']!),
          routes: [
            GoRoute(
              path: 'page3/:number',
              builder:
                  (context, state) =>
                      Page3(number: int.parse(state.pathParameters['number']!)),
              routes: [
                GoRoute(
                  path: 'page4/:flag',
                  builder:
                      (context, state) =>
                          Page4(flag: state.pathParameters['flag'] == 'true'),
                  routes: [
                    GoRoute(
                      path: 'page5',
                      builder:
                          (context, state) => Page5(
                            data:
                                state.uri.queryParameters['data'] ??
                                'нет данных',
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'GoRouter Example', routerConfig: _router);
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
          child: const Text('Go to Page 2 with message'),
          onPressed: () => context.go('/page2/HelloFromPage1'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String message;
  const Page2({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message from previous page: $message'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Go to Page 3 with number'),
              onPressed: () => context.go('/page2/$message/page3/42'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final int number;
  const Page3({super.key, required this.number});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number from previous page: $number'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Go to Page 4 with flag'),
              onPressed:
                  () => context.go(
                    '/page2/HelloFromPage1/page3/$number/page4/true',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  final bool flag;
  const Page4({super.key, required this.flag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flag from previous page: $flag'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Go to Page 5 with data (query param)'),
              onPressed:
                  () => context.go(
                    '/page2/HelloFromPage1/page3/42/page4/$flag/page5?data=Hi%20from%20Page4',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  final String data;
  const Page5({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received data (query param): $data'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Back to start'),
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }
}
