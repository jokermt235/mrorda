import 'blocs/book/book_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'service_locator.dart';
import 'blocs/book/book_bloc.dart';
import 'blocs/cart/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<BookBloc>()..add(LoadBooks())),
        BlocProvider(create: (_) => sl<CartBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Book Sale App',
      ),
    );
  }
}
