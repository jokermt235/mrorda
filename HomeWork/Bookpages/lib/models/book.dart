class Book {
  final int id;
  final String title;
  final String description;
  final List<String> pages;

  // Constructor definition with 'id' parameter
  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.pages,
  });

  // Method to convert JSON to Book object (useful for future API integration)
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      pages: List<String>.from(json['pages']),
    );
  }
}
