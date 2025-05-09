import 'package:flutter/material.dart';

class CategoryInfoWidget extends StatelessWidget {
  final String category;

  const CategoryInfoWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.withOpacity(0.1),
      ),
      child: Text(
        'Category: $category',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}