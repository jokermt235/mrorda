import 'package:finals_project/features/books/bloc/cart_bloc.dart';
import 'package:finals_project/features/books/domain/models/book.dart';
import 'package:finals_project/features/books/domain/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class BookViewPage extends StatefulWidget {
  final Book book;

  const BookViewPage({super.key, required this.book});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = 0;
              if (state is CartLoaded) {
                itemCount =
                    state.cartItems.fold(0, (sum, item) => sum + item.quantity);
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => context.go('/cart'),
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
                          itemCount.toString(),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Hero(
                tag: 'book-${widget.book.id}',
                child: CachedNetworkImage(
                  imageUrl: widget.book.coverUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.book.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.book.category,
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by ${widget.book.author}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: widget.book.rating,
                        minRating: 1,
                        itemCount: 5,
                        itemSize: 20,
                        ignoreGestures: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (_) {},
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.book.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.menu_book, color: Colors.indigo),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.book.pageCount} pages',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.book.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildCartSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSection(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int quantity = 0;
        if (state is CartLoaded) {
          final cartItem = state.cartItems.firstWhere(
            (item) => item.book.id == widget.book.id,
            orElse: () => CartItem(book: widget.book, quantity: 0),
          );
          quantity = cartItem.quantity;
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Price:', style: TextStyle(fontSize: 18)),
                  Text(
                    '\$${widget.book.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Quantity:', style: TextStyle(fontSize: 18)),
                  quantity > 0
                      ? Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => context.read<CartBloc>().add(
                                  UpdateQuantityEvent(
                                      widget.book.id, quantity - 1)),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => context.read<CartBloc>().add(
                                  UpdateQuantityEvent(
                                      widget.book.id, quantity + 1)),
                            ),
                          ],
                        )
                      : ElevatedButton.icon(
                          icon: const Icon(Icons.add_shopping_cart),
                          label: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          onPressed: () => context
                              .read<CartBloc>()
                              .add(AddToCartEvent(widget.book)),
                        ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
