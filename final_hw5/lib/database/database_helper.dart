import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/data_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('data.db');
    return _database!;
  }

  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final dbLocation = join(dbPath, path);

    return await openDatabase(dbLocation, version: 1, onCreate: _onCreate);
  }

  // Создание таблицы
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE data(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT
      )
    ''');
  }

  // Вставка данных
  Future<int> insertData(DataModel data) async {
    final db = await instance.database;
    return await db.insert('data', data.toMap());
  }

  // Получение всех данных
  Future<List<DataModel>> getAllData() async {
    final db = await instance.database;
    final result = await db.query('data');
    return result.map((map) => DataModel.fromMap(map)).toList();
  }
}
