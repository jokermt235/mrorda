import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'GoRouter Example', routerConfig: _router);
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
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
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Go to Page 1'),
            onTap: () {
              context.go('/page1/123');
            },
          ),
          ListTile(
            title: Text('Go to Page 2'),
            onTap: () {
              context.go('/page2/456');
            },
          ),
          ListTile(
            title: Text('Go to Page 3'),
            onTap: () {
              context.go('/page3/789');
            },
          ),
          ListTile(
            title: Text('Go to Page 4'),
            onTap: () {
              context.go('/page4/101');
            },
          ),
          ListTile(
            title: Text('Go to Page 5'),
            onTap: () {
              context.go('/page5/202');
            },
          ),
        ],
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
      body: Center(child: Text('Page 1 - ID: $id')),
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
      body: Center(child: Text('Page 2 - ID: $id')),
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
      body: Center(child: Text('Page 3 - ID: $id')),
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
      body: Center(child: Text('Page 4 - ID: $id')),
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
      body: Center(child: Text('Page 5 - ID: $id')),
    );
  }
}
