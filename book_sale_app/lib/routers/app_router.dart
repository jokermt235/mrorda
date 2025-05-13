import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home/home_page.dart';
import '../pages/book_view/book_view_page.dart';
import '../pages/cart/cart_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/view-book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookViewPage(bookId: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
  ],
);
