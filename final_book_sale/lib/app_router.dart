import 'package:go_router/go_router.dart';
import 'screens/home_page.dart';
import 'screens/book_view_page.dart';
import 'screens/cart_view_page.dart';
import 'models/book_model.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book',
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
