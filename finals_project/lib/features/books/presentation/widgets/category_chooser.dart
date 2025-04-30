import 'package:finals_project/features/books/bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is! BookLoaded) return const SizedBox();

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              final isSelected = category == state.selectedCategory;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  selectedColor: Colors.indigo,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  onSelected: (_) => context
                      .read<BookBloc>()
                      .add(FilterBooksByCategoryEvent(category)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
