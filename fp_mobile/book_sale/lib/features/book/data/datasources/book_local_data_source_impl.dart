import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_store/features/book/data/models/book_model.dart';
import 'package:book_store/features/book/data/datasources/book_local_data_source.dart';

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final SharedPreferences sharedPreferences;

  BookLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<BookModel>> getAllBooks() async {
    // In a real app, this would fetch from an API
    // Here we're using mock data
    return [
      BookModel(
        title: 'NO RULES RULES',
        author: 'REED HASTINGS, ERIN MEYER',
        description: 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        price: 19.99,
        pages: 320,
        category: 'Business',
        imageUrl: 'https://m.media-amazon.com/images/I/71b6+7vxVzL._AC_UF1000,1000_QL80_.jpg',
        rating: 4.5,
        isNewYorkTimesBestseller: true,
      ),
      BookModel(
        title: 'PIXAR AND BEYOND',
        author: 'LAWRENCE LEVY',
        description: 'An unlikely journey with Steve Jobs to make entertainment history.',
        price: 15.99,
        pages: 280,
        category: 'Biography',
        imageUrl: 'https://m.media-amazon.com/images/I/71b6+7vxVzL._AC_UF1000,1000_QL80_.jpg',
        rating: 4.2,
      ),
      // Add more books as needed
    ];
  }

  @override
  Future<BookModel> getBookById(String id) async {
    final books = await getAllBooks();
    return books.firstWhere((book) => book.id == id);
  }
}