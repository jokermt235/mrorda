import 'package:final_book_sale_app/features/book/presentation/pages/book_view_page.dart';
import 'package:final_book_sale_app/features/book/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/book/:id',
        builder: (context, state) => BookViewPage(
          bookId: state.pathParameters['id']!,
        ),
      ),
    ],
  );
}