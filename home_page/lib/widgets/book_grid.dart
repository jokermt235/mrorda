import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        String bookTitle = 'Book $index';

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/viewBook',
              arguments: bookTitle,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book, size: 48),
                const SizedBox(height: 8),
                Text(bookTitle),
              ],
            ),
          ),
        );
      },
    );
  }
}