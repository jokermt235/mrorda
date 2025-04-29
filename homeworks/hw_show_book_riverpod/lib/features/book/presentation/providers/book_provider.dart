import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/book.dart';

final bookListProvider = StateProvider<List<Book>>((ref) => []);
