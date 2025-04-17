class Book {
  final String title;
  final String author;
  final String description;
  final List<String> pages;

  // Конструктор
  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.pages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      pages: List<String>.from(json['pages']),
    );
  }
}
