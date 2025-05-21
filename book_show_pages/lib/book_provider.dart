import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_page.dart';

final bookProvider = StateNotifierProvider<BookNotifier, int>((ref) => BookNotifier());

class BookNotifier extends StateNotifier<int> {
  BookNotifier() : super(0); // Start from page 0

  void nextPage() {
    state++;
  }

  void previousPage() {
    if (state > 0) state--;
  }
}
