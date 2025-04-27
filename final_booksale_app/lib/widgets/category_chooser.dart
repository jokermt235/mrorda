// lib/widgets/category_chooser.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/bloc/book_bloc.dart';

class CategoryChooser extends StatefulWidget {
  const CategoryChooser({super.key});

  @override
  State<CategoryChooser> createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  String? _selectedCategory;
  final List<String> _categories = ['All', 'Fiction', 'History']; // Add more categories

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(category),
                selected: _selectedCategory == category,
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = selected ? category : null;
                  });
                  if (selected && category != 'All') {
                    context.read<BookBloc>().add(FilterBooksByCategory(category));
                  } else if (category == 'All') {
                    context.read<BookBloc>().add(LoadBooks());
                  }
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}