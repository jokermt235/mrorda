import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/page1/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return Page1(id: id);
          },
        ),
        GoRoute(
          path: '/page2/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return Page2(id: id);
          },
        ),
        GoRoute(
          path: '/page3/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return Page3(id: id);
          },
        ),
        GoRoute(
          path: '/page4/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return Page4(id: id);
          },
        ),
        GoRoute(
          path: '/page5/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return Page5(id: id);
          },
        ),
      ],
    );

    return MaterialApp.router(routerConfig: router, title: 'GoRouter Example');
  }
}

// Страницы
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/page1/1'),
              child: Text('Go to Page 1'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page2/2'),
              child: Text('Go to Page 2'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page3/3'),
              child: Text('Go to Page 3'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page4/4'),
              child: Text('Go to Page 4'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page5/5'),
              child: Text('Go to Page 5'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String id;
  Page1({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(child: Text('Page 1, ID: $id')),
    );
  }
}

class Page2 extends StatelessWidget {
  final String id;
  Page2({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(child: Text('Page 2, ID: $id')),
    );
  }
}

class Page3 extends StatelessWidget {
  final String id;
  Page3({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(child: Text('Page 3, ID: $id')),
    );
  }
}

class Page4 extends StatelessWidget {
  final String id;
  Page4({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 4')),
      body: Center(child: Text('Page 4, ID: $id')),
    );
  }
}

class Page5 extends StatelessWidget {
  final String id;
  Page5({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 5')),
      body: Center(child: Text('Page 5, ID: $id')),
    );
  }
}
