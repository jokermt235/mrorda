import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocks/movie_cubit.dart';
import 'pages/movie_list_page.dart';
import 'pages/create_movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (_) => MovieCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        initialRoute: '/',
        routes: {
          '/': (context) => const MovieListPage(),
          '/create': (context) => const CreateMoviePage(),
        },
      ),
    );
  }
}