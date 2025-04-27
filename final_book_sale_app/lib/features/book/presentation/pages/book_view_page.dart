import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_book_sale_app/features/book/domain/entities/book.dart';
import 'package:final_book_sale_app/features/book/presentation/bloc/book_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return state.maybeMap(
            loaded: (state) {
              final book = state.books.firstWhere((b) => b.id == bookId);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      book.coverImage,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'by ${book.author}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '\$${book.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.category),
                              const SizedBox(width: 8),
                              Text(book.category),
                              const Spacer(),
                              const Icon(Icons.menu_book),
                              const SizedBox(width: 8),
                              Text('${book.pageCount} pages'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            book.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Sample Pages',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: book.samplePages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    book.samplePages[index],
                                    height: 180,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  // Decrease quantity
                                },
                              ),
                              const Text('1'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  // Increase quantity
                                },
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  // Add to cart
                                },
                                child: const Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}