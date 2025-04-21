import '/features/book/presentation/pages/book_view_page.dart';
import '/features/book/presentation/pages/cart_view_page.dart';
import '/features/book/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, book, cart }

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:id',
          name: AppRoute.book.name,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return BookViewPage(bookId: id);
          },
        ),
        GoRoute(
          path: 'cart',
          name: AppRoute.cart.name,
          builder: (context, state) => const CartViewPage(),
        ),
      ],
    ),
  ],
);