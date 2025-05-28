
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends Equatable {
  @HiveField(0)
  final String id; // ISBN
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String coverUrl;
  @HiveField(4)
  final double price; // Generated for demo
  @HiveField(5)
  final int pages;
  @HiveField(6)
  final String category;
  @HiveField(7)
  final String? description;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.pages,
    required this.category,
    this.description,
  });

  factory Book.fromJson(String isbn, Map<String, dynamic> json) {
    final details = json['details'] ?? {};
    String? coverUrl = details['covers'] != null && details['covers'].isNotEmpty
        ? 'https://covers.openlibrary.org/b/id/${details['covers'][0]}-L.jpg'
        : 'https://via.placeholder.com/150';
    return Book(
      id: isbn,
      title: details['title'] ?? 'Unknown Title',
      author: (details['authors'] != null && details['authors'].isNotEmpty)
          ? details['authors'][0]['name'] ?? 'Unknown Author'
          : 'Unknown Author',
      coverUrl: coverUrl,
      price: 19.99 + (isbn.hashCode % 20), // Simulated price
      pages: details['number_of_pages'] ?? 200,
      category: (details['subjects'] != null && details['subjects'].isNotEmpty)
          ? details['subjects'][0] ?? 'General'
          : 'General',
      description: details['description'] != null
          ? (details['description'] is String
              ? details['description']
              : (details['description']['value'] ?? 'No description available'))
          : 'No description available',
    );
  }

  @override
  List<Object?> get props => [id, title, author, coverUrl, price, pages, category, description];
}
