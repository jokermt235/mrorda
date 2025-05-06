import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book/book_bloc.dart';
import '../blocs/book/book_event.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Tech', 'Fiction', 'History', 'Science'];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ActionChip(
              label: Text(categories[index]),
              onPressed: () {
                if (categories[index] == 'All') {
                  context.read<BookBloc>().add(LoadBooks());
                } else {
                  context.read<BookBloc>().add(FilterBooksByCategory(categories[index]));
                }
              },
              backgroundColor: Colors.indigoAccent,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
