import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/book_bloc.dart';
import 'bloc/book_event.dart';
import 'bloc/cart_bloc.dart';
import 'services/book_service.dart';
import 'router.dart';  // Make sure this import is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BookService bookService = BookService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc(bookService)..add(LoadBooks())),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: router,  // Ensure that the router is correctly configured
      ),
    );
  }
}
