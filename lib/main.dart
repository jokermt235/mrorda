import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'blocs/book_bloc/book_bloc.dart';
import 'blocs/cart_bloc/cart_bloc.dart';
import 'repositories/book_repository.dart';
import 'repositories/cart_repository.dart';
import 'routes.dart';  // Make sure this is imported
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BookRepository>(
          create: (context) => sl<BookRepository>(),
        ),
        RepositoryProvider<CartRepository>(
          create: (context) => sl<CartRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BookBloc(
              bookRepository: RepositoryProvider.of<BookRepository>(context),
            )..add(FetchBooks()),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: RepositoryProvider.of<CartRepository>(context),
            )..add(LoadCart()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Book Store',
          theme: ThemeData(primarySwatch: Colors.blue),
          routerConfig: router,  // Connect GoRouter here
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}