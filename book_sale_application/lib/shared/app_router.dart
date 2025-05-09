import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../catalog/pages/home_page.dart';
import '../catalog/pages/book_detail_page.dart';
import '../cart/pages/cart_page.dart';
import '../bloc/book/book_bloc.dart';
import '../bloc/book/book_state.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _buildTransition(const HomePage()),
      ),
      GoRoute(
        path: '/book/:id',
        pageBuilder: (context, state) {
          final bloc = context.read<BookBloc>();
          final loadedState = bloc.state;
          if (loadedState is! BookLoaded) {
            return _buildTransition(const HomePage());
          }
          final id = state.params['id']!;
          final book = loadedState.books.firstWhere((b) => b.id == id);
          return _buildTransition(BookDetailPage(book: book));
        },
      ),
      GoRoute(
        path: '/cart',
        pageBuilder: (context, state) => _buildTransition(const CartPage()),
      ),
    ],
  );
});

// Функция для создания красивой анимации
CustomTransitionPage _buildTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Страница появляется справа
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}