import 'package:finals_project/features/books/bloc/book_bloc.dart';
import 'package:finals_project/features/books/presentation/widgets/book_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookLoaded) {
          return Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.displayedBooks.length,
              itemBuilder: (context, index) => BookGridItem(
                book: state.displayedBooks[index],
                onTap: () => context.go(
                    '/book/${state.displayedBooks[index].id}',
                    extra: state.displayedBooks[index]),
              ),
            ),
          );
        } else if (state is BookError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
