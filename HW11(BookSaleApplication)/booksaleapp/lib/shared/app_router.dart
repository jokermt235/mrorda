   
import 'package:flutter_bloc/flutter_bloc.dart';    
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:booksaleapp/bloc/book/book_bloc.dart';
import 'package:booksaleapp/bloc/book/book_state.dart';
import 'package:booksaleapp/catalog/pages/home_page.dart';
import 'package:booksaleapp/catalog/pages/book_view_page.dart';
import 'package:booksaleapp/cart/pages/cart_view_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) => GoRouter(
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
        return BookViewPage(book: book);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartViewPage(),
    ),
  ],
));
