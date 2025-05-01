import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart';
import 'router.dart';
import 'blocs/book_bloc/book_bloc.dart';
import 'blocs/book_bloc/book_event.dart';
import 'blocs/cart_bloc/cart_bloc.dart';
import 'blocs/cart_bloc/cart_event.dart';
import 'repositories/book_repository.dart';
import 'services/cart_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create:
              (context) =>
                  BookBloc(bookRepository: sl<BookRepository>())
                    ..add(LoadCategories()),
        ),
        BlocProvider<CartBloc>(
          create:
              (context) =>
                  CartBloc(cartService: sl<CartService>())..add(LoadCart()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Book Sale App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          cardTheme: const CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
