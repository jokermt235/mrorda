import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:book_sales/features/books/pages/home_page.dart';
import 'package:book_sales/features/books/pages/book_detail_page.dart';
import 'package:book_sales/features/cart/pages/cart_page.dart';
import 'package:book_sales/features/books/bloc/book_bloc.dart';
import 'package:book_sales/features/books/bloc/book_state.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/book/:id',
        builder: (context, state) {
          final bloc = context.read<BookBloc>();
          final loaded = bloc.state;
          if (loaded is! BookLoaded) {
            return const HomePage();
          }
          final id = state.params['id']!;
          final book = loaded.books.firstWhere((b) => b.id == id);
          return BookDetailPage(book: book);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartPage(),
      ),
    ],
  );
});