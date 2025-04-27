import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/book.dart';

class BookView extends StatelessWidget {
  final Book book;
  final int quantity;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  final VoidCallback onDecreaseQuantity;

  const BookView({
    super.key,
    required this.book,
    required this.quantity,
    required this.onAddToCart,
    required this.onRemoveFromCart,
    required this.onDecreaseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: book.coverUrl,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            book.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'by ${book.author}',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Chip(
                label: Text(book.category),
                backgroundColor: Colors.blue[100],
              ),
              const Spacer(),
              Text(
                '${book.pages} pages',
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '\$${book.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            book.description,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Sample Pages',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: book.samplePages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CachedNetworkImage(
                    imageUrl: book.samplePages[index],
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24.0),
          if (quantity > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onDecreaseQuantity,
                ),
                Text(
                  quantity.toString(),
                  style: const TextStyle(fontSize: 20.0),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAddToCart,
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: onRemoveFromCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Remove'),
                ),
              ],
            )
          else
            Center(
              child: ElevatedButton(
                onPressed: onAddToCart,
                child: const Text('Add to Cart'),
              ),
            ),
        ],
      ),
    );
  }
}