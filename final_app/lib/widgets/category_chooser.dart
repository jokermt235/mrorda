import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategoryChooser({super.key, required this.categories, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ActionChip(
              label: Text(category),
              onPressed: () => onCategorySelected(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}
