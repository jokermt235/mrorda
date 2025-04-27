// lib/widgets/category_chooser.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksaleapp/blocs/home/home_bloc.dart';

class CategoryChooser extends StatefulWidget {
  const CategoryChooser({super.key});

  @override
  State<CategoryChooser> createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  String? _selectedCategory;
  final List<String> _categories = ['All', 'Science Fiction', 'Romance', 'Dystopian', 'Fiction', 'Fantasy'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((category) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ChoiceChip(
            label: Text(category),
            selected: _selectedCategory == category,
            onSelected: (selected) {
              setState(() {
                _selectedCategory = selected ? category : null;
              });
              print('CategoryChooser - Selected category: $category'); // ADD THIS LINE
              context.read<HomeBloc>().add(FilterByCategory(category: category));
            },
          ),
        )).toList(),
      ),
    );
  }
}