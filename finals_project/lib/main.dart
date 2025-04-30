import 'package:finals_project/config/router.dart';
import 'package:finals_project/config/service_locator.dart';
import 'package:finals_project/features/books/bloc/book_bloc.dart';
import 'package:finals_project/features/books/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create: (context) => getIt<BookBloc>()..add(LoadBooksEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => getIt<CartBloc>()..add(LoadCartEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Book Store App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.grey[100],
          cardTheme: CardTheme(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
