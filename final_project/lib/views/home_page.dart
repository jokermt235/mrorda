import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/book_bloc.dart';
import '../services/book_service.dart';
import '../service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _category = "All";
  String _search = "";

  @override
  Widget build(BuildContext context) {
    final categories = sl<BookService>().getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          // SearchBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search books...",
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
              onChanged: (val) {
                setState(() => _search = val);
                context.read<BookBloc>().add(LoadBooks(category: _category, search: val));
              },
            ),
          ),
          // CategoryChooser
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: _category,
              items: categories.map((cat) =>
                DropdownMenuItem(value: cat, child: Text(cat))
              ).toList(),
              dropdownColor: Colors.grey[900],
              onChanged: (val) {
                setState(() => _category = val!);
                context.read<BookBloc>().add(LoadBooks(category: val!, search: _search));
              },
            ),
          ),
          // BookGrid
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state.books.isEmpty) {
                  return const Center(child: Text("No books found.", style: TextStyle(color: Colors.white70)));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7,
                  ),
                  itemCount: state.books.length,
                  itemBuilder: (context, idx) {
                    final book = state.books[idx];
                    return GestureDetector(
                      onTap: () => context.go('/book/${book.id}'),
                      child: Card(
                        color: Colors.grey[900],
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.network(book.coverUrl, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(book.author, style: const TextStyle(color: Colors.white70)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}