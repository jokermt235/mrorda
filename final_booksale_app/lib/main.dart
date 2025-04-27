// lib/main.dart
import 'package:flutter/material.dart';
import 'package:final_booksale_app/services/service_locator.dart' as sl_init;
// ignore: unused_import
import 'package:go_router/go_router.dart';
import 'package:final_booksale_app/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/bloc/book_bloc.dart';
import 'package:final_booksale_app/bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl_init.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create: (context) => BookBloc()..add(LoadBooks()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}