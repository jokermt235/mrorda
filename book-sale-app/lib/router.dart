import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/book.dart';
import 'pages/home_page.dart';
import 'pages/book_view_page.dart';
import 'pages/cart_view_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/book/:bookId',
      builder: (BuildContext context, GoRouterState state) {
        final Book? book = state.extra as Book?;
        final String bookId = state.pathParameters['bookId'] ?? 'unknown';

        if (book != null) {
          return BookViewPage(book: book);
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text('Book data missing for ID: $bookId')),
          );
        }
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (BuildContext context, GoRouterState state) {
        return const CartViewPage();
      },
    ),
  ],
  errorBuilder:
      (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(child: Text('Error: ${state.error}')),
      ),
);
