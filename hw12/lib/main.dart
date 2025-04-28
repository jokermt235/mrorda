import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'services/service_locator.dart';
import 'screens/home_page.dart';
import 'screens/book_view_page.dart';
import 'screens/cart_view_page.dart';
import 'blocs/book/book_bloc.dart';
import 'blocs/cart/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookViewPage(bookId: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartViewPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<BookBloc>()..add(LoadBooks())),
        BlocProvider(create: (_) => getIt<CartBloc>()..add(LoadCart())),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Book Sale App',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
