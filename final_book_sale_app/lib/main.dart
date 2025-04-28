import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locator/service_locator.dart';
import 'routes/app_router.dart';
import 'cubits/book_cubit.dart';
import 'cubits/cart_cubit.dart';

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
        BlocProvider(create: (_) => sl<BookCubit>()..loadBooks()),
        BlocProvider(create: (_) => sl<CartCubit>()..loadCart()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
