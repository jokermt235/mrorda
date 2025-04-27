import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw12_booksale/book_bloc.dart';
import 'package:hw12_booksale/book.dart';
import 'package:hw12_booksale/category_chooser.dart';
import 'package:go_router/go_router.dart';
import 'cart_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          BlocBuilder<CartBloc, Map<Book, int>>(
            builder: (context, cart) {
              final totalItems = cart.values.fold<int>(
                0,
                (sum, quantity) => sum + quantity,
              );

              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () => context.go('/cart'),
                  ),
                  if (totalItems > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '$totalItems',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          CategoryChooser(
            categories: ['Programming', 'Self-help', 'History'],
            onCategorySelected: (selectedCategory) {
              if (selectedCategory != null) {
                context.read<BookBloc>().add(
                  FilterBooksByCategory(selectedCategory),
                );
              }
            },
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                  final filteredBooks =
                      state.books.where((book) {
                        return book.title.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        );
                      }).toList();

                  if (filteredBooks.isEmpty) {
                    return Center(child: Text('No books found.'));
                  }

                  return ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = filteredBooks[index];
                      return ListTile(
                        leading:
                            book.coverUrl.isNotEmpty
                                ? Image.network(
                                  book.coverUrl,
                                  width: 50,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                                : Icon(Icons.book),
                        title: Text(book.title),
                        subtitle: Text(
                          'Pages: ${book.pages} | \$${book.price}',
                        ),
                        onTap: () => context.go('/book/${book.id}'),
                      );
                    },
                  );
                } else if (state is BookError) {
                  return Center(child: Text('Failed to load books.'));
                }
                return Center(child: Text('No books available.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
