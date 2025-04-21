import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';
import 'service_locator.dart';
import '/features/book/bloc/book_bloc.dart';


class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<BookBloc>()..add(LoadBooks())),
      ],
      child: MaterialApp.router(
        title: 'Book Store',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        // Update the theme in BookApp widget
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.brown,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
  
}
