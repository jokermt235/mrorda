import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/movie_cubit.dart';
import '../models/movie.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список фильмов'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/create'),
          ),
        ],
      ),
      body: BlocBuilder<MovieCubit, List<Movie>>(
        builder: (context, movies) {
          if (movies.isEmpty) {
            return const Center(child: Text('Фильмы пока не добавлены'));
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text('Жанр: ${movie.genre}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<MovieCubit>().removeMovie(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}