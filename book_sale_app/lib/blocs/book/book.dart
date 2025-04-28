class Book {
  final String id;
  final String title;
  final String coverUrl;
  final String category;
  final double price;
  final int pageCount;

  Book({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.category,
    required this.price,
    required this.pageCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      coverUrl: json['coverUrl'],
      category: json['category'],
      price: json['price'].toDouble(),
      pageCount: json['pageCount'],
    );
  }
}
