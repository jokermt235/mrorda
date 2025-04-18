import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookPageIndexProvider = StateNotifierProvider<BookPageIndexNotifier, int>(
  (ref) => BookPageIndexNotifier(),
);

class BookPageIndexNotifier extends StateNotifier<int> {
  BookPageIndexNotifier() : super(0);

  void next(int maxPages) {
    state = (state + 1) % maxPages;
  }
}
