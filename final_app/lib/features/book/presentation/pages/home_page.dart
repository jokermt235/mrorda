import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/book/bloc/book_bloc.dart';
import '/features/book/presentation/widgets/book_grid.dart';
import '/features/book/presentation/widgets/category_chooser.dart';
import '/features/book/presentation/widgets/search_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Update the AppBar in HomePage
appBar: AppBar(
  title: const Text(
    'Book Store',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  backgroundColor: Colors.brown.shade600,
  actions: [
    Badge(
      label: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            final count = state.books
                .where((book) => book.quantity > 0)
                .fold(0, (sum, book) => sum + book.quantity);
            return Text(count.toString());
          }
          return const Text('0');
        },
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () => context.goNamed('cart'),
      ),
    ),
    const SizedBox(width: 8),
  ],
),
      body: Column(
        children: [
          const SearchBarWidget(),
          const CategoryChooser(),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookError) {
                  return Center(child: Text(state.message));
                } else if (state is BookLoaded) {
                  return BookGrid(books: state.filteredBooks);
                }
                return const Center(child: Text('No books available'));
              },
            ),
          ),
        ],
      ),
    );
  }
}