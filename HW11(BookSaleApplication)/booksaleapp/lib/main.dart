import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:booksaleapp/shared/app_router.dart';
import 'package:booksaleapp/service/book_service.dart';
import 'package:booksaleapp/bloc/book/book_bloc.dart';
import 'package:booksaleapp/bloc/book/book_event.dart';
import 'package:booksaleapp/bloc/cart/cart_bloc.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookService = ref.watch(bookServiceProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BookBloc(bookService)..add(LoadBooks()),
        ),
        BlocProvider(
          create: (_) => CartBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: ref.watch(appRouterProvider),
      ),
    );
  }
}