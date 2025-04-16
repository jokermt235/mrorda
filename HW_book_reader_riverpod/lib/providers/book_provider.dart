import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book_model.dart';

final bookProvider = Provider<Book>((ref) {
  return Book(
    title: 'Sample Book',
    pages: [
      'Page 1: Once upon a time...',
      'Page 2: They lived happily...',
      'Page 3: The end.',
    ],
  );
});

final currentPageIndexProvider = StateProvider<int>((ref) => 0);
