import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  // Setup GoRouter with paths and parameters
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      // Home page (root)
      GoRoute(
        path: '/',
        builder: (context, state) {
          return HomePage();
        },
      ),
      // Page 1 (Name)
      GoRoute(
        path: '/page1/:name',
        builder: (context, state) {
          final name = state.params['name']!;
          return Page1(name: name);
        },
      ),
      // Page 2 (Country)
      GoRoute(
        path: '/page2/:country',
        builder: (context, state) {
          final country = state.params['country']!;
          return Page2(country: country);
        },
      ),
      // Page 3 (City)
      GoRoute(
        path: '/page3/:city',
        builder: (context, state) {
          final city = state.params['city']!;
          return Page3(city: city);
        },
      ),
      // Page 4 (Age)
      GoRoute(
        path: '/page4/:age',
        builder: (context, state) {
          final age = state.params['age']!;
          return Page4(age: age);
        },
      ),
      // Page 5 (Profession)
      GoRoute(
        path: '/page5/:profession',
        builder: (context, state) {
          final profession = state.params['profession']!;
          return Page5(profession: profession);
        },
      ),
    ],
  );
}

// HomePage Widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => context.go('/page1/Nurzhibek'),
            child: Text('Page 1'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/page2/Kyrgyzstan'),
            child: Text('Page 2'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/page3/Bishkek'),
            child: Text('Page 3'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/page4/20'),
            child: Text('Page 4'),
          ),
          ElevatedButton(
            onPressed: () => context.go('/page5/Developer'),
            child: Text('Page 5'),
          ),
        ],
      ),
    );
  }
}

// Page 1 Widget (Name)
class Page1 extends StatelessWidget {
  final String name;
  Page1({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1 (Name)')),
      body: Center(child: Text('Hello, $name!')),
    );
  }
}

// Page 2 Widget (Country)
class Page2 extends StatelessWidget {
  final String country;
  Page2({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2 (Country)')),
      body: Center(child: Text('You are from $country.')),
    );
  }
}

// Page 3 Widget (City)
class Page3 extends StatelessWidget {
  final String city;
  Page3({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3 (City)')),
      body: Center(child: Text('You live in $city.')),
    );
  }
}

// Page 4 Widget (Age)
class Page4 extends StatelessWidget {
  final String age;
  Page4({required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 4 (Age)')),
      body: Center(child: Text('You are $age years old.')),
    );
  }
}

// Page 5 Widget (Profession)
class Page5 extends StatelessWidget {
  final String profession;
  Page5({required this.profession});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 5 (Profession)')),
      body: Center(child: Text('Your profession is $profession.')),
    );
  }
}
