import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT)');
      },
    );
  }

  Future<void> saveUsername(String username) async {
    final dbClient = await db;
    await dbClient.insert(
      'user',
      {'id': 1, 'name': username},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getUsername() async {
    final dbClient = await db;
    final result = await dbClient.query('user', where: 'id = ?', whereArgs: [1]);
    if (result.isNotEmpty) {
      return result.first['name'] as String;
    }
    return null;
  }
}
