import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/book/book_bloc.dart';
import '../widgets/book_grid.dart';
import '../widgets/category_filter_chip.dart';
import '../widgets/book_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookstore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => GoRouter.of(context).push('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BookSearchBar(
              onSearch: (query) => context.read<BookBloc>().add(SearchBooks(query)),
            ),
          ),
          const CategoryFilterChips(),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookError) {
                  return Center(child: Text(state.message));
                } else if (state is BookLoaded) {
                  return BookGrid(books: state.books);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}