import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryTile('Fiction'),
          CategoryTile('Science'),
          CategoryTile('History'),
          CategoryTile('Biography'),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;
  const CategoryTile(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(category),
      ),
    );
  }
}