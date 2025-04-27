import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';

// провайдер книги
final bookProvider = Provider<Book>((ref) {
  return const Book(
    title: 'The Great Adventure',
    pages: [
      'Page 1: Once upon a time...',
      'Page 2: They embarked on a journey...',
      'Page 3: Adventures unfolded...',
      'Page 4: Lessons were learned...',
      'Page 5: The End.',
    ],
  );
});

// Провайдер текущей страницы
final currentPageProvider = StateProvider<int>((ref) => 0);
