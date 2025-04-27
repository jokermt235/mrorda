import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Category 0', 'Category 1', 'Category 2', 'Category 3'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (c, i) => ActionChip(
          label: Text(categories[i]),
          onPressed: () {
          },
        ),
      ),
    );
  }
}