import 'package:go_router/go_router.dart';
import '../views/home_page.dart';
import '../views/book_view_page.dart';
import '../views/cart_view_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'book/:id',
          builder:
              (context, state) =>
                  BookViewPage(bookId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: 'cart',
          builder: (context, state) => const CartViewPage(),
        ),
      ],
    ),
  ],
);
