import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/book_view/presentation/pages/book_view_page.dart';
import '../../features/cart/presentation/pages/cart_view_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:id',
          builder: (context, state) {
            final id = state.params['id']!;
            return BookViewPage(bookId: id);
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
