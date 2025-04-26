import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/book_bloc/book_bloc.dart';
import '../blocs/book_bloc/book_event.dart';
import '../blocs/book_bloc/book_state.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../blocs/cart_bloc/cart_state.dart';
import '../widgets/book_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Sale'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              int itemCount = 0;
              if (cartState is CartLoaded) {
                itemCount = cartState.totalItems;
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => context.push('/cart'),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Books or Authors',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text;
                    context.read<BookBloc>().add(SearchBooks(query));
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (query) {
                context.read<BookBloc>().add(SearchBooks(query));
              },
            ),
          ),
          BlocBuilder<BookBloc, BookState>(
            buildWhen:
                (previous, current) =>
                    current is BookLoaded || current is BookLoading,
            builder: (context, state) {
              if (state is BookLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children:
                        state.categories.map((category) {
                          return ChoiceChip(
                            label: Text(category),
                            selected: state.activeCategory == category,
                            onSelected: (selected) {
                              if (selected) {
                                context.read<BookBloc>().add(
                                  FilterBooksByCategory(category),
                                );
                              }
                            },
                          );
                        }).toList(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is BookLoaded) {
                  if (state.books.isEmpty) {
                    return const Center(child: Text("No books found."));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return BookGridItem(
                        book: book,
                        onTap: () {
                          context.push('/book/${book.id}', extra: book);
                        },
                      );
                    },
                  );
                }
                if (state is BookError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(
                  child: Text('Please search or filter books.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
