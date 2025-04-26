class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final int pages;
  final double price;
  final String category;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.pages,
    required this.price,
    required this.category,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String,
      pages: json['pages'] as int,
      price: json['price'] as double,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'pages': pages,
      'price': price,
      'category': category,
    };
  }
}