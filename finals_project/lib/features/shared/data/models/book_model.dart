class BookModel {
  final String title;
  final String coverUrl;
  final String category;
  final double price;
  final int pages;

  // Конструктор
  BookModel({
    required this.title,
    required this.coverUrl,
    required this.category,
    required this.price,
    required this.pages,
  });

  // Метод для преобразования JSON в объект BookModel
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? '',
      coverUrl: json['coverUrl'] ?? '',
      category: json['category'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      pages: json['pages']?.toInt() ?? 0,
    );
  }
}
