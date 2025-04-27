import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksaleapp/blocs/home/home_bloc.dart';
import 'package:final_booksaleapp/widgets/search_bar.dart';
import 'package:final_booksaleapp/widgets/book_grid.dart';
import 'package:final_booksaleapp/widgets/category_chooser.dart';
import 'package:go_router/go_router.dart';
import 'package:final_booksaleapp/services/book_service.dart';

class HomePage extends material.StatelessWidget {
  const HomePage({super.key});

  @override
  material.Widget build(material.BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(bookService: BookService())..add(LoadBooks()),
      child: material.Scaffold(
        appBar: material.AppBar(
          title: const material.Text('Book Sale'),
          actions: [
            material.IconButton(
              icon: const material.Icon(material.Icons.shopping_cart),
              onPressed: () => context.go('/cart'),
            ),
          ],
        ),
        body: material.Padding(
          padding: const material.EdgeInsets.all(16.0),
          child: material.Column(
            children: [
              const SearchBar(),
              const material.SizedBox(height: 16.0),
              const CategoryChooser(),
              const material.SizedBox(height: 16.0),
              material.Expanded(child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  print('HomePage BlocBuilder - Current State: ${state.runtimeType}');
                  if (state is HomeLoading) {
                    print('HomePage BlocBuilder - State is HomeLoading');
                    return const material.Center(child: material.CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    print('HomePage BlocBuilder - State is HomeLoaded, displaying BookGrid');
                    return BookGrid(books: state.filteredBooks);
                  } else if (state is HomeError) {
                    print('HomePage BlocBuilder - State is HomeError: ${state.message}');
                    return material.Center(child: material.Text('Error loading books: ${state.message}'));
                  } else {
                    print('HomePage BlocBuilder - State is UNHANDLED: ${state.runtimeType}');
                    return const material.Center(child: material.Text('Something went wrong.'));
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}