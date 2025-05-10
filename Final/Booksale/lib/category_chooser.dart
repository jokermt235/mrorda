import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  final List<String> categories;
  final ValueChanged<String?> onCategorySelected;

  const CategoryChooser({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Category',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        items:
            categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
        onChanged: onCategorySelected,
      ),
    );
  }
}
