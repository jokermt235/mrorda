import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/book_view_page.dart';
import '../pages/cart_view_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => _buildPage(const HomePage()),
    ),
    GoRoute(
      path: '/book/:id',
      pageBuilder: (context, state) {
        final id = state.pathParameters['id']!;
        return _buildPage(BookViewPage(bookId: id));
      },
    ),
    GoRoute(
      path: '/cart',
      pageBuilder: (context, state) => _buildPage(const CartViewPage()),
    ),
  ],
);

CustomTransitionPage _buildPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
