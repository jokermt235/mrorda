// lib/app_router.dart
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:final_booksale_app/presentation/screens/home_page.dart';
import 'package:final_booksale_app/presentation/screens/book_view_page.dart';
import 'package:final_booksale_app/presentation/screens/cart_view_page.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:bookId',
          name: 'book_details',
          builder: (context, state) {
            final bookId = state.pathParameters['bookId']!;
            return BookViewPage(bookId: bookId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartViewPage(),
    ),
  ],
);