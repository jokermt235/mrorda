// lib/router.dart

import 'package:go_router/go_router.dart';
import 'package:final_booksaleapp/presentation/home/home_page.dart';
import 'package:final_booksaleapp/presentation/view_book/view_book_page.dart';
import 'package:final_booksaleapp/presentation/cart/cart_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
      GoRoute(
        path: '/book/:id',
        builder: (BuildContext context, GoRouterState state) {
          final bookId = state.pathParameters['id'];
          return ViewBookPage(bookId: bookId);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) => const CartView(),
      ),
    ],
  );
}