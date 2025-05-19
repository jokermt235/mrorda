import 'package:booksale_application/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/book_model.dart';
import '../../presentation/bloc/book/book_bloc.dart';
import '../../presentation/bloc/cart/cart_bloc.dart';

class BookViewPage extends StatefulWidget {
  final String bookId;
  const BookViewPage({super.key, required this.bookId});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(FetchBookById(widget.bookId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookError) {
            return Center(child: Text(state.message));
          } else if (state is BookDetailLoaded) {
            return _BookDetails(book: state.book);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _BookDetails extends StatelessWidget {
  final BookModel book;
  const _BookDetails({required this.book});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final cartItem = cartBloc.state.items.firstWhere(
          (item) => item.book.id == book.id,
      orElse: () => CartItemModel(book: book, quantity: 0),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: book.coverUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            book.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'by ${book.author}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Chip(label: Text(book.category)),
              const SizedBox(width: 8),
              Text('${book.pageCount} pages'),
              const Spacer(),
              Text(
                '\$${book.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              final quantity = cartState.items
                  .where((item) => item.book.id == book.id)
                  .fold(0, (sum, item) => sum + item.quantity);
              return Row(
                children: [
                  if (quantity > 0) ...[
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => cartBloc.add(RemoveFromCart(book)),
                    ),
                    Text(quantity.toString()),
                  ],
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => cartBloc.add(AddToCart(book)),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}