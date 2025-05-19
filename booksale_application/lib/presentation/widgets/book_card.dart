import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/book_model.dart';
import '../../../presentation/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => GoRouter.of(context).push('/book/${book.id}'),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: book.coverUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                book.title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                book.author,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 1,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${book.price.toStringAsFixed(2)}'),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(book));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added ${book.title} to cart')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}