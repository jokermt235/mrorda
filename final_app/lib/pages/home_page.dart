import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_bloc.dart';
import '../widgets/book_grid.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_chooser.dart';
import '../router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.push('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(
            onChanged: (query) {
              context.read<BookCubit>().searchBooks(query);
            },
          ),
          CategoryChooser(
            categories: const ['All', 'Programming', 'Science', 'Art'],
            onCategorySelected: (category) {
              context.read<BookCubit>().searchBooks(category == 'All' ? '' : category);
            },
          ),
          Expanded(
            child: BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                return BookGrid(
                  books: state.filteredBooks,
                  onBookTap: (book) => context.push('/book/${book.id}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
