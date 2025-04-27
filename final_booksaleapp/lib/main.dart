// lib/main.dart

import 'package:flutter/material.dart';
import 'package:final_booksaleapp/app.dart';
import 'package:final_booksaleapp/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksaleapp/blocs/cart/cart_bloc.dart';

void main() {
  final appRouter = AppRouter();
  runApp(
    BlocProvider<CartBloc>( // Providing CartBloc at the top level
      create: (context) => CartBloc(),
      child: MyApp(router: appRouter.router), // Pass the GoRouter instance
    ),
  );
}