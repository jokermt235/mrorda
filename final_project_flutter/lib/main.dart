import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'bloc/book_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'service_locator.dart';
import 'views/home_page.dart';
import 'views/book_view_page.dart';
import 'views/cart_view_page.dart';

void main() {
  setupServiceLocator();
  runApp(const BookSaleApp());
}

class BookSaleApp extends StatelessWidget {
  const BookSaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(path: '/book/:id', builder: (context, state) {
          final id = state.params['id']!;
          return BookViewPage(bookId: id);
        }),
        GoRoute(path: '/cart', builder: (context, state) => const CartViewPage()),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
      ],
      child: MaterialApp.router(
        title: 'Book Sale App',
        theme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Colors.deepPurple,
            secondary: Colors.deepPurpleAccent,
          ),
          scaffoldBackgroundColor: const Color(0xFF181818),
        ),
        routerConfig: router,
      ),
    );
  }
}