import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home_page.dart'; // Убедись, что эти файлы есть
import 'screens/book_view_page.dart'; // и здесь тоже

void main() {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(
        path: '/book/:id',
        builder: (context, state) {
          final id = state.params['id']!;
          return BookViewPage(
            book: Book(
              id: id,
              title: 'Book $id',
              author: 'Author $id',
              coverUrl: '',
              pages: 100,
              price: 19.99,
            ),
          );
        },
      ),
    ],
  );

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  MyApp({required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
