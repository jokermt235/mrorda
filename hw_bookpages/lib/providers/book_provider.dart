import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';

final bookProvider = Provider<Book>((ref) {
  return Book(
    title: 'Flutter for Beginners',
    pages: [
      'Page 1: Welcome to Flutter!',
      'Page 2: What is a Widget?',
      'Page 3: Understanding State',
      'Page 4: Riverpod Basics',
      'Page 5: Congrats! 🎉',
    ],
  );
});

final currentPageProvider = StateProvider<int>((ref) => 0);
