import 'package:go_router/go_router.dart';
import '../../presentation/pages/book_view_page.dart';
import '../../presentation/pages/cart_view_page.dart';
import '../../presentation/pages/home_page.dart';

final router = GoRouter(
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