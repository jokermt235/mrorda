import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/book/book_bloc.dart';
import '../../bloc/book/book_event.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Science Fiction', 'Classics', 'Horror'];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ActionChip(
              label: Text(category),
              onPressed: () {
                if (category == 'All') {
                  context.read<BookBloc>().add(LoadBooks());
                } else {
                  context.read<BookBloc>().add(FilterBooksByCategory(category));
                }
              },
            ),
          );
        },
      ),
    );
  }
}