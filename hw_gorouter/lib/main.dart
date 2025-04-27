import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // Страница 1: Принимает параметр `id`
    GoRoute(
      path: '/page1/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return Page1(id: id);
      },
    ),
    // Страница 2: Принимает query-параметр (`?name=John`)
    GoRoute(
      path: '/page2',
      builder: (context, state) {
        final name = state.uri.queryParameters['name'] ?? 'Гость';
        return Page2(name: name);
      },
    ),
    // Страница 3: Принимает объект через extra
    GoRoute(
      path: '/page3',
      builder: (context, state) {
        final user = state.extra as User?;
        return Page3(user: user);
      },
    ),
    // Страница 4: Вложенные параметры
    GoRoute(
      path: '/page4/:category/:productId',
      builder: (context, state) {
        final category = state.pathParameters['category']!;
        final productId = state.pathParameters['productId']!;
        return Page4(category: category, productId: productId);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

// Главная страница с кнопками навигации
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/page1/123'),  // Передаем ID
              child: const Text('Страница 1 (ID)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page2?name=John'),  // Query-параметр
              child: const Text('Страница 2 (Имя)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page3', extra: User('Анна', 25)),  // Объект
              child: const Text('Страница 3 (Объект)'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page4/electronics/789'),  // Два параметра
              child: const Text('Страница 4 (Категория + ID)'),
            ),
          ],
        ),
      ),
    );
  }
}

// Примеры страниц
class Page1 extends StatelessWidget {
  final String id;
  const Page1({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Страница 1: ID=$id')),
      body: Center(child: Text('Полученный ID: $id')),
    );
  }
}

class Page2 extends StatelessWidget {
  final String name;
  const Page2({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Привет, $name!')),
      body: Center(child: Text('Query-параметр: name=$name')),
    );
  }
}

class Page3 extends StatelessWidget {
  final User? user;
  const Page3({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Страница 3')),
      body: Center(
        child: user == null
            ? const Text('Объект не передан')
            : Text('Пользователь: ${user!.name}, ${user!.age} лет'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  final String category;
  final String productId;
  const Page4({super.key, required this.category, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Категория: $category')),
      body: Center(child: Text('Товар ID: $productId')),
    );
  }
}
