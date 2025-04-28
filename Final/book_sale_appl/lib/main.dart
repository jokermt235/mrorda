import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locator.dart';
import 'blocs/book_bloc.dart';
import 'blocs/cart_bloc.dart';
import 'router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()..loadBooks()),
        BlocProvider(create: (_) => CartBloc()..loadCart()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Book Sale App',
      ),
    );
  }
}
