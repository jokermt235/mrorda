import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'service_locator.dart';
import 'blocs/cart_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CartCubit>(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Book Store',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
