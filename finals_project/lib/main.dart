import 'package:finals_project/features/home/presentation/pages/home_page.dart';
import 'package:finals_project/features/shared/domain/presentation/blocs/book_bloc.dart';
import 'package:finals_project/features/shared/domain/presentation/blocs/book_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      home: BlocProvider(
        create:
            (context) =>
                BookBloc()..add(FetchBooks()), // Загружаем книги при старте
        child: const HomePage(),
      ),
    );
  }
}
