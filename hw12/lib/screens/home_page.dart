import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/book/book_bloc.dart';
import '../widgets/book_grid.dart';
import '../widgets/category_chooser.dart';
import '../blocs/cart/cart_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  String searchQuery = '';

  final Map<String, String> categoryDescriptions = {
    'All': 'Browse all available books.',
    'Programming': 'Master the art of coding with our programming books.',
    'Software Engineering': 'Learn how to design and build robust systems.',
    'Game Development': 'Create amazing games with top-notch techniques.',
    'Interview Prep': 'Crack your tech interviews with confidence.',
    'Project Management': 'Manage projects like a true professional.',
    'Productivity': 'Boost your skills and workflow efficiency.',
    'AI & Development': 'Explore the future with AI and development.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Sale App'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              int totalItems = cartState.cartItems.fold(
                0,
                    (previousValue, item) => previousValue + item.quantity,
              );

              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => context.go('/cart'),
                  ),
                  if (totalItems > 0)
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$totalItems',
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
              decoration: const InputDecoration(
                hintText: 'Search books...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          CategoryChooser(
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  categoryDescriptions[selectedCategory] ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                  var books = selectedCategory == 'All'
                      ? state.books
                      : state.books.where((book) => book.category == selectedCategory).toList();

                  if (searchQuery.isNotEmpty) {
                    books = books.where((book) =>
                        book.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
                  }

                  return BookGrid(books: books);
                } else {
                  return const Center(child: Text('Error loading books'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
