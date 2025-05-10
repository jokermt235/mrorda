import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'service_locator.dart';
import 'book_bloc.dart';
import 'cart_bloc.dart';
import 'home_page.dart';
import 'book_view_page.dart';
import 'cart_view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => HomePage()),
    GoRoute(
      path: '/book/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BookViewPage(bookId: id);
      },
    ),
    GoRoute(path: '/cart', builder: (_, __) => CartViewPage()),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<BookBloc>()..add(FetchBooks())),
        BlocProvider(create: (_) => sl<CartBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Book App',
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
