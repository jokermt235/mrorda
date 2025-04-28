import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/book_view_page.dart';
import 'pages/cart_view_page.dart';
import 'models/book.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/book',
      pageBuilder: (context, state) {
        final book = state.extra as Book;
        return CustomTransitionPage(
          child: BookViewPage(book: book),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      path: '/cart',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: const CartViewPage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
    ),
  ],
);
