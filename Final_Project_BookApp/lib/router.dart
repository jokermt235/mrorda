  import 'package:go_router/go_router.dart';
  import 'pages/home_page.dart';
  import 'pages/book_view_page.dart';
  import 'pages/cart_view_page.dart';
  import '../models/book.dart';  // Import the Book model

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
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
        builder: (context, state) => CartViewPage(),
      ),
    ],
  );
