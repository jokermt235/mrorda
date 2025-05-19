import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/categories.dart';
import '../bloc/book/book_bloc.dart';

class CategoryFilterChips extends StatelessWidget {
  const CategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        // Get the currently selected category from the state
        final selectedCategory = state.selectedCategory;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Category.values.map((category) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: Text(category.name),
                  selected: selectedCategory == category.name,
                  onSelected: (isSelected) {
                    // Dispatch event to filter by category
                    context.read<BookBloc>().add(
                      FilterByCategory(category.name),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}