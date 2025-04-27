import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'shop.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL
          )
        ''');
      },
    );
  }

  static Future<void> addProduct(Product product) async {
    final db = await database;
    await db.insert('products', product.toMap());
  }

  static Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }

  static Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
