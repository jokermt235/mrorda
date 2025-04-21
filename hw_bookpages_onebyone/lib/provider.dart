import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookPagesProvider = Provider<List<String>>(
  (ref) => ['page 1.', 'page 2.', 'page 3.', 'page 4.'],
);
final currentPageProvider = StateProvider<int>((ref) => 0);
