import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

// НАСТРОЙКА GoRouter
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
        path: '/page1/:name',
        builder: (context, state) => Page1(name: state.pathParameters['name']!)),
    GoRoute(
        path: '/page2/:age',
        builder: (context, state) => Page2(age: state.pathParameters['age']!)),
    GoRoute(
        path: '/page3/:city',
        builder: (context, state) => Page3(city: state.pathParameters['city']!)),
    GoRoute(
        path: '/page4/:color',
        builder: (context, state) => Page4(color: state.pathParameters['color']!)),
    GoRoute(
        path: '/page5/:hobby',
        builder: (context, state) => Page5(hobby: state.pathParameters['hobby']!)),
  ],
);

// ОСНОВНОЕ ПРИЛОЖЕНИЕ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Style Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

// СТОРОННЕЕ МЕНЮ
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrawerHeader(
            child: Text('Book Menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          MenuButton(label: 'Page 1 (Alice)', route: '/page1/Alice'),
          MenuButton(label: 'Page 2 (Age 25)', route: '/page2/25'),
          MenuButton(label: 'Page 3 (London)', route: '/page3/London'),
          MenuButton(label: 'Page 4 (Red)', route: '/page4/Red'),
          MenuButton(label: 'Page 5 (Reading)', route: '/page5/Reading'),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final String route;
  const MenuButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: () => context.go(route),
    );
  }
}

// ГЛАВНАЯ СТРАНИЦА
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideMenu(),
          const Expanded(
            child: Center(
              child: Text(
                '📖 Welcome to the Book App\n\nChoose a page from the left menu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ОБЩИЙ ШАБЛОН ДЛЯ ВСЕХ СТРАНИЦ
Widget pageLayout(BuildContext context, String title, String content) {
  return Scaffold(
    body: Row(
      children: [
        const SideMenu(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(content, style: const TextStyle(fontSize: 22)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// СТРАНИЦЫ
class Page1 extends StatelessWidget {
  final String name;
  const Page1({super.key, required this.name});

  @override
  Widget build(BuildContext context) =>
      pageLayout(context, 'Page 1', 'Hello, $name!');
}

class Page2 extends StatelessWidget {
  final String age;
  const Page2({super.key, required this.age});

  @override
  Widget build(BuildContext context) =>
      pageLayout(context, 'Page 2', 'You are $age years old');
}

class Page3 extends StatelessWidget {
  final String city;
  const Page3({super.key, required this.city});

  @override
  Widget build(BuildContext context) =>
      pageLayout(context, 'Page 3', 'Welcome to $city');
}

class Page4 extends StatelessWidget {
  final String color;
  const Page4({super.key, required this.color});

  @override
  Widget build(BuildContext context) =>
      pageLayout(context, 'Page 4', 'Your favorite color is $color');
}

class Page5 extends StatelessWidget {
  final String hobby;
  const Page5({super.key, required this.hobby});

  @override
  Widget build(BuildContext context) =>
      pageLayout(context, 'Page 5', 'Your hobby is $hobby');
}
 