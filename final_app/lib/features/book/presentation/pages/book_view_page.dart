import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/book/bloc/book_bloc.dart';
import '/features/book/data/models/book_model.dart';
import 'package:go_router/go_router.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoaded) {
          final book = state.books.firstWhere((b) => b.id == bookId);
          return Scaffold(
            appBar: AppBar(
              title: Text(book.title),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => context.goNamed('cart'),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      book.coverUrl,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                    'Price: \$${book.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('Pages: ${book.pageCount}'),
                  const SizedBox(height: 8),
                  Text('Categories: ${book.categories.join(', ')}'),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(book.description),
                  const SizedBox(height: 16),
                  Text(
                    'Sample Pages',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: book.samplePages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            book.samplePages[index],
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Update the quantity controls in BookViewPage
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      icon: Icon(Icons.remove_circle_outline, 
                color: Colors.brown.shade800),
      onPressed: () {
        context.read<BookBloc>().add(DecreaseQuantity(bookId: book.id));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed one ${book.title} from cart'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '${book.quantity} in cart',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.brown.shade800,
        ),
      ),
    ),
    IconButton(
      icon: Icon(Icons.add_circle_outline, 
                color: Colors.brown.shade800),
      onPressed: () {
        context.read<BookBloc>().add(AddToCart(bookId: book.id));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added ${book.title} to cart'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    ),
  ],
),
const SizedBox(height: 16),
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.brown.shade600,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      context.read<BookBloc>().add(AddToCart(bookId: book.id));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added ${book.title} to cart'),
          duration: const Duration(seconds: 1),
        ),
      );
    },
    child: const Text('Add to Cart', style: TextStyle(fontSize: 18)),
  ),
),
                ],
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}