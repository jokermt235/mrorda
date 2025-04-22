import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/movie_cubit.dart';
import '../models/movie.dart';

class CreateMoviePage extends StatelessWidget {
  const CreateMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final genreController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Добавить фильм')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Название фильма'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(labelText: 'Жанр'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final genre = genreController.text;

                if (title.isNotEmpty && genre.isNotEmpty) {
                  final movie = Movie(title: title, genre: genre);
                  context.read<MovieCubit>().addMovie(movie);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Пожалуйста, заполните все поля')),
                  );
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}