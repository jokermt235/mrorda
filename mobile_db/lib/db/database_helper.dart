import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  // Получение экземпляра базы данных
  Future<Database> get database async {
    if (_database != null) return _database!;  // Возвращаем уже существующую базу
    _database = await _initDB();  // Инициализируем базу, если она ещё не была создана
    return _database!;
  }

  // Инициализация базы данных и создание таблицы
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user.db');  // Путь к базе данных
    try {
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT)',  // Создание таблицы
          );
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  // Метод для добавления пользователя в базу
  Future<void> insertUser(String username) async {
    final db = await database;
    await db.insert(
      'users',
      {'username': username},
      conflictAlgorithm: ConflictAlgorithm.replace,  // Заменяет существующую запись, если такая есть
    );
  }

  // Метод для получения всех пользователей из базы
  Future<List<String>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');  // Запрос на извлечение данных
    return List.generate(maps.length, (i) => maps[i]['username'] as String);  // Преобразуем список в строковый список
  }
}
