import 'package:finals_project/features/shared/domain/presentation/blocs/book_bloc.dart';
import 'package:finals_project/features/shared/domain/presentation/blocs/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_grid.dart';
import '../widgets/category_chooser.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Store')),
      body: Column(
        children: [
          // Поиск книг
          const SearchBar(),

          // Выбор категории книг
          const CategoryChooser(),

          // Сетка для отображения книг
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                  return BookGrid(books: state.books);
                } else if (state is BookError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
