class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final double price;
  final int pageCount;
  final String category;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.pageCount,
    required this.category,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      coverUrl: json['coverUrl'] ?? 'https://via.placeholder.com/150',
      price: (json['price'] as num).toDouble(),
      pageCount: json['pageCount'] ?? 0,
      category: json['category'] ?? 'Unknown',
    );
  }
}