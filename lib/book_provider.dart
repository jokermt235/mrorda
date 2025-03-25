import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'book.dart';
import 'service.dart';

part 'book_provider.g.dart';

@riverpod
Future<List<Book>> book(Ref ref) async {
  Service service = BookService();
  final List<dynamic> json = jsonDecode( await service.getRemoteData());
  final books = json.cast<Map<String, dynamic>>().map((e) => Book.fromJson(e)).toList();
  return books;
}