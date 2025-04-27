import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_book_sale_app/features/book/presentation/bloc/book_bloc.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Programming',
      'Fiction',
      'Non-Fiction',
      'Science',
      'History',
      'Biography'
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: false,
              onSelected: (selected) {
                context.read<BookBloc>().add(
                  FilterByCategory(categories[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}