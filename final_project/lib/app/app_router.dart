import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/book/presentation/pages/home_page.dart';
import '../../features/book/presentation/pages/book_details_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:id',
          builder: (_, state) => BookDetailsPage(
            bookId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'cart',
          builder: (_, __) => const CartPage(),
        ),
      ],
    ),
  ],
);