import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store/features/home/presentation/bloc/home_bloc.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) return const SizedBox.shrink();

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FilterChip(
                  label: Text(category),
                  selected: index == 0 && state.filteredBooks == state.books ||
                      state.filteredBooks.isNotEmpty &&
                          state.filteredBooks[0].category == category,
                  onSelected: (selected) {
                    context.read<HomeBloc>().add(
                      FilterByCategoryEvent(
                        category: index == 0 ? null : category,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}