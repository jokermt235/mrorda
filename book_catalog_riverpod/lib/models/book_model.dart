import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Book {
  final String id;
  final String title;
  final String author;
  final int year;
  final bool isRead;

  Book({
    String? id,
    required this.title,
    required this.author,
    required this.year,
    this.isRead = false,
  }) : id = id ?? uuid.v4();

  Book copyWith({
    String? title,
    String? author,
    int? year,
    bool? isRead,
  }) {
    return Book(
      id: id,
      title: title ?? this.title,
      author: author ?? this.author,
      year: year ?? this.year,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, year: $year, isRead: $isRead)';
  }
}