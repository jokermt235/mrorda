import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';
import '../features/book/presentation/book_bloc/book_bloc.dart';
import '../features/cart/presentation/cart_bloc/cart_bloc.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()..add(LoadBooks())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
      ],
      child: MaterialApp.router(
        title: 'Book Store',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}