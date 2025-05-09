import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/book/book_bloc.dart';
import '../../bloc/book/book_state.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is BookLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return _AnimatedBookCard(book: book);
            },
          );
        }
        return const Center(child: Text('Something went wrong.'));
      },
    );
  }
}

class _AnimatedBookCard extends StatefulWidget {
  final dynamic book;
  const _AnimatedBookCard({required this.book});

  @override
  State<_AnimatedBookCard> createState() => _AnimatedBookCardState();
}

class _AnimatedBookCardState extends State<_AnimatedBookCard> {
  double _scale = 1.0;

  void _onTapDown(_) {
    setState(() {
      _scale = 0.97;
    });
  }

  void _onTapUp(_) {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: const Duration(milliseconds: 150),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => GoRouter.of(context).push('/book/${widget.book.id}'),
        onTapDown: _onTapDown,
        onTapCancel: () => _onTapUp(null),
        onTapUp: _onTapUp,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.book.image,
                width: 60,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              widget.book.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.book.author,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${widget.book.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, color: Colors.deepPurple),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}