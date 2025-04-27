import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_sales/core/router/app_router.dart';
import 'package:book_sales/core/services/book_service.dart';
import 'package:book_sales/features/books/bloc/book_bloc.dart';
import 'package:book_sales/features/books/bloc/book_event.dart';
import 'package:book_sales/features/cart/bloc/cart_bloc.dart';

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
          primaryColor: Colors.pink,
          scaffoldBackgroundColor: const Color(0xFFF8F8F8),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.greenAccent,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        routerConfig: ref.watch(appRouterProvider),
      ),
    );
  }
}