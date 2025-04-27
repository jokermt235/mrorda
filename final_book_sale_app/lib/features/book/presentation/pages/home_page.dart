import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_book_sale_app/features/book/presentation/bloc/book_bloc.dart';
import 'package:final_book_sale_app/widgets/book_grid.dart';
import 'package:final_book_sale_app/widgets/category_chooser.dart';
import 'package:final_book_sale_app/widgets/book_search_bar.dart' as my_app;
import 'package:get_it/get_it.dart'; // Added for service locator



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance; // Get service locator instance

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<BookBloc>()..add(const LoadBooks()),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:  my_app.BookSearchBar(), // Changed to CustomSearchBar
            ),
            const CategoryChooser(),
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (state) => BookGrid(books: state.books),
                    orElse: () => const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}