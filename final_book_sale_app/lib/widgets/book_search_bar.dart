import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_book_sale_app/features/book/presentation/bloc/book_bloc.dart';

class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  final _debouncer = _Debouncer(milliseconds: 500);
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search books...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onChanged: (query) {
        _debouncer.run(() {
          if (query.length >= 2 || query.isEmpty) {
            context.read<BookBloc>().add(SearchBooks(query));
          }
        });
      },
    );
  }
}

class _Debouncer {
  final int milliseconds;
  VoidCallback? _callback;
  Timer? _timer;

  _Debouncer({required this.milliseconds});

  void run(VoidCallback callback) {
    _callback = callback;
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), _flush);
  }

  void _flush() {
    _callback?.call();
    _callback = null;
  }

  void dispose() {
    _timer?.cancel();
  }
}