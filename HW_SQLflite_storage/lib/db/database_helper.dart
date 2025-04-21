// lib/db/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }
}
