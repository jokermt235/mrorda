class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final String description;
  final double price;
  final int pages;
  final String coverUrl;
  final List<String> samplePages;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.price,
    required this.pages,
    required this.coverUrl,
    required this.samplePages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      price: json['price'].toDouble(),
      pages: json['pages'],
      coverUrl: json['coverUrl'],
      samplePages: List<String>.from(json['samplePages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'price': price,
      'pages': pages,
      'coverUrl': coverUrl,
      'samplePages': samplePages,
    };
  }
}