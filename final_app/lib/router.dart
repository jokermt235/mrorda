import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/book_view_page.dart';
import 'pages/cart_view_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookViewPage(id: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartViewPage(),
    ),
  ],
);
