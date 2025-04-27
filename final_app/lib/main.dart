import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart';
import 'bloc/book_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'router.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookCubit>(create: (_) => sl<BookCubit>()),
        BlocProvider<CartCubit>(create: (_) => sl<CartCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Book Sale',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueAccent,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
