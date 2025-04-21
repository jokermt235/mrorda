import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/book/bloc/book_bloc.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is! BookLoaded) return const SizedBox();

        final categories = state.books
            .expand((book) => book.categories)
            .toSet()
            .toList()
          ..insert(0, 'All');

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final selected = state.selectedCategory == categories[index] ||
                  (state.selectedCategory.isEmpty &&
                      categories[index] == 'All');

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(
                    categories[index],
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.brown.shade800,
                    ),
                  ),
                  selected: selected,
                  onSelected: (selected) {
                    context.read<BookBloc>().add(
                          FilterByCategory(
                            category: categories[index] == 'All'
                                ? ''
                                : categories[index],
                          ),
                        );
                  },
                  selectedColor: Colors.brown.shade600,
                  backgroundColor: Colors.brown.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
