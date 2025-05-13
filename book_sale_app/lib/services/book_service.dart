import 'dart:convert';
import '../models/book.dart';

class BookService {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(Duration(seconds: 2)); // имитация запроса
    final response = '''
    [
      {
        "id": "1",
        "title": "Clean Code",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780132350884-us.jpg",
        "category": "Programming",
        "price": 34.99,
        "pageCount": 464
      },
      {
        "id": "2",
        "title": "Dune",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780441172719-us.jpg",
        "category": "Science Fiction",
        "price": 22.99,
        "pageCount": 688
      },
      {
        "id": "3",
        "title": "Thinking, Fast and Slow",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780374530785-us.jpg",
        "category": "Psychology",
        "price": 19.99,
        "pageCount": 512
      },
      {
        "id": "4",
        "title": "The Great Gatsby",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780743273565-us.jpg",
        "category": "Fiction",
        "price": 12.99,
        "pageCount": 180
      },
      {
        "id": "5",
        "title": "The Power of Habit",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780812981605-us.jpg",
        "category": "Self-Help",
        "price": 16.99,
        "pageCount": 416
      },
      {
        "id": "6",
        "title": "A Brief History of Time",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780553380163-us.jpg",
        "category": "Science",
        "price": 18.99,
        "pageCount": 256
      },
      {
        "id": "7",
        "title": "The Lean Startup",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780307887894-us.jpg",
        "category": "Business",
        "price": 27.99,
        "pageCount": 336
      },
      {
        "id": "8",
        "title": "Pride and Prejudice",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780141439518-us.jpg",
        "category": "Fiction",
        "price": 11.99,
        "pageCount": 432
      },
      {
        "id": "9",
        "title": "The Design of Everyday Things",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780465050659-us.jpg",
        "category": "Design",
        "price": 23.99,
        "pageCount": 368
      },
      {
        "id": "10",
        "title": "The Subtle Art of Not Giving a F*ck",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780062457714-us.jpg",
        "category": "Self-Help",
        "price": 17.99,
        "pageCount": 224
      },
      {
        "id": "11",
        "title": "The Fellowship of the Ring",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780547928210-us.jpg",
        "category": "Fantasy",
        "price": 21.99,
        "pageCount": 576
      },
      {
        "id": "12",
        "title": "Guns, Germs, and Steel",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780393317558-us.jpg",
        "category": "History",
        "price": 25.99,
        "pageCount": 512
      },
      {
        "id": "13",
        "title": "The Catcher in the Rye",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780316769488-us.jpg",
        "category": "Fiction",
        "price": 13.99,
        "pageCount": 277
      },
      {
        "id": "14",
        "title": "Deep Work",
        "coverUrl": "https://pictures.abebooks.com/isbn/9781455586691-us.jpg",
        "category": "Productivity",
        "price": 22.99,
        "pageCount": 304
      },
      {
        "id": "15",
        "title": "The Four Agreements",
        "coverUrl": "https://pictures.abebooks.com/isbn/9781878424310-us.jpg",
        "category": "Self-Help",
        "price": 14.99,
        "pageCount": 168
      },
      {
        "id": "16",
        "title": "The Selfish Gene",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780199291151-us.jpg",
        "category": "Science",
        "price": 20.99,
        "pageCount": 496
      },
      {
        "id": "17",
        "title": "The Hitchhiker's Guide to the Galaxy",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780345391803-us.jpg",
        "category": "Science Fiction",
        "price": 16.99,
        "pageCount": 320
      },
      {
        "id": "18",
        "title": "The Art of War",
        "coverUrl": "https://pictures.abebooks.com/isbn/9781599869773-us.jpg",
        "category": "Philosophy",
        "price": 10.99,
        "pageCount": 152
      },
      {
        "id": "19",
        "title": "The Diary of a Young Girl",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780553577129-us.jpg",
        "category": "Biography",
        "price": 14.99,
        "pageCount": 352
      },
      {
        "id": "20",
        "title": "Mistborn: The Final Empire",
        "coverUrl": "https://pictures.abebooks.com/isbn/9780765311788-us.jpg",
        "category": "Fantasy",
        "price": 23.99,
        "pageCount": 672
      }
    ]
    ''';

    final List data = json.decode(response);
    return data.map((e) => Book.fromJson(e)).toList();
  }
}
