import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/features/books/bloc/book_bloc.dart';
import 'package:flutter_application_2/features/books/bloc/book_event.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  static final List<String> categories = [
    'All',
    'Adventure',
    'Fantasy',
    'Horror',
    'Sci-Fi',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ActionChip(
            label: Text(category),
            onPressed: () {
              final bloc = context.read<BookBloc>();
              if (category == 'All') {
                bloc.add(LoadBooks());
              } else {
                bloc.add(FilterBooksByCategory(category));
              }
            },
          );
        },
      ),
    );
  }
}
