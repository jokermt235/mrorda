import 'package:go_router/go_router.dart';
import 'package:book_store/features/home/presentation/pages/home_page.dart';
import 'package:book_store/features/book/presentation/pages/book_view_page.dart';
import 'package:book_store/features/cart/presentation/pages/cart_view_page.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'book/:id',
            builder: (context, state) => BookViewPage(
              bookId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: 'cart',
            builder: (context, state) => const CartViewPage(),
          ),
        ],
      ),
    ],
  );
}