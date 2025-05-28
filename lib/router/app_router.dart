import 'package:go_router/go_router.dart';
import 'package:book_sale_app/screens/home_page.dart';
import 'package:book_sale_app/screens/book_view_page.dart';
import 'package:book_sale_app/screens/cart_view_page.dart';
import 'package:book_sale_app/models/book.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final book = state.extra as Book;
        return BookViewPage(book: book);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartViewPage(),
    ),
  ],
);
