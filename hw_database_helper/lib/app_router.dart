import 'package:go_router/go_router.dart';
import 'package:multi_bloc_app/pages/home_page.dart';
import 'package:multi_bloc_app/pages/second_page.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/second',
        name: 'second',
        builder: (context, state) => const SecondPage(),
      ),
    ],
  );
}