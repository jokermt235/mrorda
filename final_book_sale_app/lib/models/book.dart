class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String category;
  final int pages;
  final String coverUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.pages,
    required this.coverUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      price: json['price'].toDouble(),
      category: json['category'],
      pages: json['pages'],
      coverUrl: json['coverUrl'],
    );
  }
}
