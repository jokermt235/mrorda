import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  BookViewPage({required this.book});

  final Color pink1 = Color(0xFFFF90BB);
  final Color pink2 = Color(0xFFFFC1DA);
  final Color cream = Color(0xFFF8F8E1);
  final Color blue = Color(0xFF8ACCD5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(book.title, style: TextStyle(color: pink1)),
        iconTheme: IconThemeData(color: pink1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                book.coverImage,
                height: 250,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '«${book.title}»',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: pink1,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'by ${book.author}', // <<<<< show author here
              style: TextStyle(
                fontSize: 18,
                color: blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Pages: ${book.pageCount}',
              style: TextStyle(
                fontSize: 16,
                color: blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: ${book.price.toStringAsFixed(2)} USD',
              style: TextStyle(
                fontSize: 20,
                color: pink2,
                fontWeight: FontWeight.w600,  
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(AddToCart(book));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to Cart!'),
                      backgroundColor: pink1,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: pink1,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
