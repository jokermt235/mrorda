import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/book_bloc/book_bloc.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/category_chooser.dart';
import '../widgets/book_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(FetchBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.push('/cart'), // Fixed GoRouter navigation
          ),
        ],
      ),
      body: Column(
        children: [
          custom.CustomSearchBar(
            onSearch: (query) {
              context.read<BookBloc>().add(SearchBooks(query: query));
            },
          ),
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookLoaded) {
                final categories = state.books
                    .map((book) => book.category)
                    .toSet()
                    .toList();

                return CategoryChooser(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                    context
                        .read<BookBloc>()
                        .add(FilterBooksByCategory(category: category));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookInitial || state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookError) {
                  return Center(child: Text(state.message));
                } else if (state is BookLoaded) {
                  return BookGrid(
                    books: state.filteredBooks,
                    onBookSelected: (book) {
                      context.push('/book/${book.id}'); // Consistent navigation
                    },
                  );
                }
                return const Center(child: Text('Unknown state'));
              },
            ),
          ),
        ],
      ),
    );
  }
}