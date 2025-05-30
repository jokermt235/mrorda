import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/book_bloc.dart';
import '../models/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => GoRouter.of(context).go('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          const CategoryChooser(),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                  return BookGrid(books: state.books);
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

// Виджет поиска (теперь публичный класс)
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search books...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: (query) {
        context.read<BookBloc>().add(FilterBooks(query));
      },
    );
  }
}

// Виджет выбора категории
class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Programming', 'Fiction', 'Business'];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: false,
              onSelected: (selected) {
                context.read<BookBloc>().add(
                  FilterByCategory(categories[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Виджет сетки книг
class BookGrid extends StatelessWidget {
  final List<Book> books;

  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () => GoRouter.of(context).go('/book/${book.id}'),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child:
                      book.coverUrl.isNotEmpty
                          ? Image.network(book.coverUrl, fit: BoxFit.cover)
                          : const Placeholder(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('\$${book.price.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
