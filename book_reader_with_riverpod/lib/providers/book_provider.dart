import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw7_book_reader_with_riverpod/models/book.dart';

class BookNotifier extends StateNotifier<Book> {
  BookNotifier()
    : super(
        Book(
          id: '1',
          title: '«title»',
          author: 'author',
          pages: [
            'page1',
            'page2',
            'page3',
          ],
          currentPageIndex: 0,
        ),
      );

  void nextPage() {
    if (state.currentPageIndex < state.pages.length - 1) {
      state = state.copyWith(currentPageIndex: state.currentPageIndex + 1);
    }
  }

  void previousPage() {
    if (state.currentPageIndex > 0) {
      state = state.copyWith(currentPageIndex: state.currentPageIndex - 1);
    }
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, Book>((ref) {
  return BookNotifier();
});
