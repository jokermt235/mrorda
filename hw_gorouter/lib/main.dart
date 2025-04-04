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
}

// ✅ Define GoRouter with 5 Pages
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/page1/:name',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? 'Guest';
        return Page1(name: name);
      },
    ),
    GoRoute(
      path: '/page2/:age',
      builder: (context, state) {
        final age = state.pathParameters['age'] ?? 'Unknown';
        return Page2(age: age);
      },
    ),
    GoRoute(
      path: '/page3/:city',
      builder: (context, state) {
        final city = state.pathParameters['city'] ?? 'Unknown';
        return Page3(city: city);
      },
    ),
    GoRoute(
      path: '/page4/:country',
      builder: (context, state) {
        final country = state.pathParameters['country'] ?? 'Unknown';
        return Page4(country: country);
      },
    ),
  ],
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/page1/Argen'),
              child: Text('Go to Page 1 (Name: Argen)'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/page2/22'),
              child: Text('Go to Page 2 (Age: 22)'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/page3/Bishkek'),
              child: Text('Go to Page 3 (City: Bishkek)'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/page4/Kyrgyzstan'),
              child: Text('Go to Page 4 (Country: Kyrgyzstan)'),
            ),
          ],
        ),
      ),
    );
  }
}


class Page1 extends StatelessWidget {
  final String name;
  Page1({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(child: Text('Hello, $name!', style: TextStyle(fontSize: 24))),
    );
  }
}


class Page2 extends StatelessWidget {
  final String age;
  Page2({required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(child: Text('Age: $age', style: TextStyle(fontSize: 24))),
    );
  }
}


class Page3 extends StatelessWidget {
  final String city;
  Page3({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(child: Text('City: $city', style: TextStyle(fontSize: 24))),
    );
  }
}


class Page4 extends StatelessWidget {
  final String country;
  Page4({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 4')),
      body: Center(child: Text('Country: $country', style: TextStyle(fontSize: 24))),
    );
  }
}


