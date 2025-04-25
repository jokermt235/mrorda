import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
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
        final age = state.pathParameters['age']!;
        return Page2(age: age);
      },
    ),
    GoRoute(
      path: '/page3/:city',
      builder: (context, state) {
        final city = state.pathParameters['city']!;
        return Page3(city: city);
      },
    ),
    GoRoute(
      path: '/page4/:color',
      builder: (context, state) {
        final color = state.pathParameters['color']!;
        return Page4(color: color);
      },
    ),
    GoRoute(
      path: '/page5/:hobby',
      builder: (context, state) {
        final hobby = state.pathParameters['hobby']!;
        return Page5(hobby: hobby);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Go to Page 1'),
            onTap: () => context.go('/page1/John'),
          ),
          ListTile(
            title: const Text('Go to Page 2'),
            onTap: () => context.go('/page2/25'),
          ),
          ListTile(
            title: const Text('Go to Page 3'),
            onTap: () => context.go('/page3/New York'),
          ),
          ListTile(
            title: const Text('Go to Page 4'),
            onTap: () => context.go('/page4/Blue'),
          ),
          ListTile(
            title: const Text('Go to Page 5'),
            onTap: () => context.go('/page5/Reading'),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String name;
  const Page1({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Text('Hello, $name!', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String age;
  const Page2({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Text('You are $age years old.', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String city;
  const Page3({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Text('Welcome to $city!', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  final String color;
  const Page4({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(
        child: Text('Your favorite color is $color.', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  final String hobby;
  const Page5({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: Center(
        child: Text('Your hobby is $hobby.', style: Theme.of(context).textTheme.displayMedium),
      ),
    );
  }
}
