import 'package:go_router/go_router.dart';
import 'views/home_page.dart';
import 'views/book_view_page.dart';
import 'views/cart_view_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/book', builder: (context, state) => const BookViewPage()),
    GoRoute(path: '/cart', builder: (context, state) => const CartViewPage()),
  ],
);
