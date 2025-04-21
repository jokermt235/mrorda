import 'package:book_store/core/services/service_locator.dart';
import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store/features/book/presentation/bloc/book_bloc.dart';
import 'package:book_store/features/book/data/models/book_model.dart';
import 'package:book_store/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:go_router/go_router.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookBloc(
            bookRepository: locator.get<BookRepository>())
            ..add(LoadBookEvent(bookId: bookId)),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            cartRepository: locator.get<CartRepository>(),
          )..add(LoadCartEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                context.go('/cart');
              },
            ),
          ],
        ),
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookError) {
              return Center(child: Text(state.message));
            } else if (state is BookLoaded) {
              return _BookDetailsView(book: state.book);
            }
            return const Center(child: Text('No book found'));
          },
        ),
      ),
    );
  }
}

class _BookDetailsView extends StatelessWidget {
  final BookModel book;

  const _BookDetailsView({required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              book.imageUrl,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          if (book.isNewYorkTimesBestseller)
            const Text(
              'NEW YORK TIMES BESTSELLER',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          const SizedBox(height: 10),
          Text(
            book.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 5),
          Text(
            'by ${book.author}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildRatingStars(book.rating),
              const SizedBox(width: 5),
              Text('${book.rating}'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Price: \$${book.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'Pages: ${book.pages}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Category: ${book.category}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Description',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(book.description),
          const SizedBox(height: 30),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              final isInCart = cartState is CartLoaded &&
                  cartState.cartItems.any((item) => item.book.id == book.id);
              
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isInCart) {
                      context.read<CartBloc>().add(RemoveFromCartEvent(book: book));
                    } else {
                      context.read<CartBloc>().add(AddToCartEvent(book: book));
                    }
                  },
                  child: Text(isInCart ? 'REMOVE FROM CART' : 'ADD TO CART'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    final fullStars = rating.floor();
    final hasHalfStar = rating - fullStars >= 0.5;
    final emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 20),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 20),
        for (int i = 0; i < emptyStars; i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 20),
      ],
    );
  }
}