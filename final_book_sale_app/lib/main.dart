import 'package:flutter/material.dart';
import 'package:final_book_sale_app/app/app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<Database> initDatabase() async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, 'books.db');
  print('Database path: $path');

  final books = [
    {
      'title': 'Clean Code',
      'author': 'Robert Martin',
      'coverImage': 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1347470803i/10284614.jpg',
      'price': 29.99,
      'category': 'Programming',
      'pageCount': 464,
      'description': 'A handbook of agile software craftsmanship...'
    },
    {
      'title': 'The Pragmatic Programmer',
      'author': 'Andrew Hunt, David Thomas',
      'coverImage': 'https://images-na.ssl-images-amazon.com/images/I/51a3hK4u0HL._SX379_BO1,204,203,200_.jpg',
      'price': 34.95,
      'category': 'Programming',
      'pageCount': 352,
      'description': 'Your journey to mastery in programming starts here...'
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'coverImage': 'https://images-na.ssl-images-amazon.com/images/I/41dJv1X8lSL._SX307_BO1,204,203,200_.jpg',
      'price': 15.99,
      'category': 'Fiction',
      'pageCount': 328,
      'description': 'A dystopian novel set in a totalitarian society...'
    },
    {
      'title': 'Sapiens: A Brief History of Humankind',
      'author': 'Yuval Noah Harari',
      'coverImage': 'https://images-na.ssl-images-amazon.com/images/I/41v0YyQOdTL._SX324_BO1,204,203,200_.jpg',
      'price': 19.99,
      'category': 'Non-Fiction',
      'pageCount': 443,
      'description': 'An exploration of the history of humankind...'
    },
    {
      'title': 'A Brief History of Time',
      'author': 'Stephen Hawking',
      'coverImage': 'https://images-na.ssl-images-amazon.com/images/I/41j6vZ3BieL._SX331_BO1,204,203,200_.jpg',
      'price': 18.99,
      'category': 'Science',
      'pageCount': 212,
      'description': 'A landmark volume in science writing...'
    }
  ];


  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      print('Creating new database...');
      try {
        await db.execute('''
          CREATE TABLE books(
            id TEXT PRIMARY KEY,
            title TEXT,
            author TEXT,
            coverImage TEXT,
            price REAL,
            category TEXT,
            pageCount INTEGER,
            description TEXT
          )
        ''');
        print('Table created successfully');

        for (var book in books) {
          final id = await db.insert('books', {
            'title': book['title'],
            'author': book['author'],
            'coverImage': book['coverImage'],
            'price': book['price'],
            'category': book['category'],
            'pageCount': book['pageCount'],
            'description': book['description']
          });
          print('Book inserted with id: $id');
        }

      } catch (e) {
        print('Error during DB init: $e');
      }
    },
    onOpen: (db) async {
      final tables = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='books'"
      );
      print('Existing tables: $tables');

    },
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await initDatabase();
  runApp(BookSaleApp());
}
