import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_sale_app/models/book.dart';

class BookService {
  Future<List<Book>> fetchBooks() async {
    const isbns = [
      '1931498717',
      '9780439554930',
      '9780140283334',
      '9780590353427',
      '0072986220',
      '5040027141',
      '0553381687',
          '349211640X',
      '1533377871',
    ];
    final bibkeys = isbns.map((isbn) => 'ISBN:$isbn').join(',');
    final url =
        'http://openlibrary.org/api/books?bibkeys=$bibkeys&jscmd=details&format=json';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return jsonData.entries
            .map((entry) => Book.fromJson(
                entry.key.replaceFirst('ISBN:', ''), entry.value))
            .toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }
}