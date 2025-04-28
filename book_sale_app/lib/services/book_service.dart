import 'dart:convert';
import '../models/book.dart';

class BookService {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(Duration(seconds: 2)); // имитация запроса
    final response = '''
    [
      {
        "id": "1",
        "title": "Flutter for Beginners",
        "coverUrl": "https://m.media-amazon.com/images/I/81xy7n1Kh3L._AC_UF1000,1000_QL80_.jpg",
        "category": "Programming",
        "price": 29.99,
        "pageCount": 250
      },
      {
        "id": "2",
        "title": "Beginning Flutter with Dart",
        "coverUrl": "https://m.media-amazon.com/images/I/61sedQFJ2aL._UF1000,1000_QL80_.jpg",
        "category": "Programming",
        "price": 39.99,
        "pageCount": 300
      },
      {
        "id": "3",
        "title": "The Alchemist",
        "coverUrl": "https://m.media-amazon.com/images/I/71+2-t7M35L._AC_UF1000,1000_QL80_.jpg",
        "category": "Fiction",
        "price": 19.99,
        "pageCount": 208
      },
      {
        "id": "4",
        "title": "Atomic Habits",
        "coverUrl": "https://m.media-amazon.com/images/I/81ANaVZk5LL.jpg",
        "category": "Self-Help",
        "price": 24.99,
        "pageCount": 320
      },
      {
        "id": "5",
        "title": "1984",
        "coverUrl": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327144697i/3744438.jpg",
        "category": "Science Fiction",
        "price": 14.99,
        "pageCount": 328
      },
      {
        "id": "6",
        "title": "Rich Dad Poor Dad",
        "coverUrl": "https://www.jarir.com/cdn-cgi/image/fit=contain,width=380,height=380,quality=100,metadata=none/https://ak-asset.jarir.com/akeneo-prod/asset/m1images/4/8/480009.jpg",
        "category": "Finance",
        "price": 21.99,
        "pageCount": 336
      },
      {
        "id": "7",
        "title": "The Hobbit",
        "coverUrl": "https://m.media-amazon.com/images/I/81uEDUfKBZL._AC_UF894,1000_QL80_.jpg",
        "category": "Fantasy",
        "price": 17.99,
        "pageCount": 310
      },
      {
        "id": "8",
        "title": "Sapiens",
        "coverUrl": "https://basket-12.wbbasket.ru/vol1727/part172755/172755500/images/big/1.webp",
        "category": "History",
        "price": 26.99,
        "pageCount": 464
      },
      {
        "id": "9",
        "title": "Магия утра",
        "coverUrl": "https://www.mann-ivanov-ferber.ru/assets/images/covers/04/25504/1.00x-thumb.png",
        "category": "Self-Help",
        "price": 18.99,
        "pageCount": 224
      },
      {
        "id": "10",
        "title": "Becoming",
        "coverUrl": "https://m.media-amazon.com/images/I/81cJTmFpG-L.jpg",
        "category": "Biography",
        "price": 28.99,
        "pageCount": 448
      }
    ]
    ''';

    final List data = json.decode(response);
    return data.map((e) => Book.fromJson(e)).toList();
  }
}
