class Book {
  final String title;
  final List<String> pages;

  Book({
    required this.title,
    required this.pages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      pages: List<String>.from(json['pages'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'pages': pages,
    };
  }
}
