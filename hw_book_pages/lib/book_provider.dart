import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw_book_pages/book_page.dart';

final bookPagesProvider = Provider<List<BookPage>>((ref) {
  return List.generate(
    10,
    (index) => BookPage(
      pageNumber: index + 1,
      content: 'Page ${index + 1}',
    ),
  );
});

final currentPageProvider = StateProvider<int>((ref) => 0);
