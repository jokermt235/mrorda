// lib/presentation/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/bloc/book_bloc.dart';
import 'package:final_booksale_app/widgets/book_grid.dart';
import 'package:final_booksale_app/widgets/category_chooser.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc()..add(LoadBooks()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Sale'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => context.goNamed('cart'),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => context.read<BookBloc>().add(SearchBooks(value)),
                decoration: const InputDecoration(
                  hintText: 'Search for books...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const CategoryChooser(),
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
                    return const Center(child: Text('Something went wrong!'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}