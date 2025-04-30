import 'package:finals_project/features/books/presentation/pages/home_page.dart';
import 'package:finals_project/features/books/presentation/pages/book_view_page.dart';
import 'package:finals_project/features/books/domain/models/book.dart';
import 'package:finals_project/features/books/presentation/pages/cart_view_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
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
