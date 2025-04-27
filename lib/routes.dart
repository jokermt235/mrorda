import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/book_view_page.dart';
import 'pages/cart_view_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:id',
          builder: (context, state) {
            final bookId = state.pathParameters['id']!;
            return BookViewPage(bookId: bookId);
          },
        ),
        GoRoute(
          path: 'cart',
          builder: (context, state) => const CartViewPage(),
        ),
      ],
    ),
  ],
);