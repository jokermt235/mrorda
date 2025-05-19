import 'package:booksale_application/presentation/bloc/book/book_bloc.dart';
import 'package:booksale_application/presentation/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/service_locator.dart';
import 'core/services/mock_book_database.dart';

void main() async {
  setupServiceLocator();
  await getIt<MockBookDatabase>().initializeMockData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BookBloc>()..add(FetchBooks())),
        BlocProvider(create: (context) => getIt<CartBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Book Sale Application',
        theme: ThemeData(/*...*/),
      ),
    );
  }
}