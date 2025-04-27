import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const _dbName = 'app_database.db';
  static const _dbVersion = 1;
  static const tableName = 'app_settings';
  static const columnId = 'id';
  static const columnCounter = 'counter';
  static const columnIsLightTheme = 'is_light_theme';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getDatabasesPath();
    final path = join(documentsDirectory, _dbName);
    
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY,
        $columnCounter INTEGER NOT NULL,
        $columnIsLightTheme INTEGER NOT NULL
      )
    ''');
    
    // Insert initial data
    await db.insert(tableName, {
      columnId: 1,
      columnCounter: 0,
      columnIsLightTheme: 1, // 1 for true (light theme)
    });
  }

  Future<int> getCounterValue() async {
    final db = await database;
    final maps = await db.query(
      tableName,
      columns: [columnCounter],
      where: '$columnId = ?',
      whereArgs: [1],
    );
    return maps.first[columnCounter] as int;
  }

  Future<bool> getThemePreference() async {
    final db = await database;
    final maps = await db.query(
      tableName,
      columns: [columnIsLightTheme],
      where: '$columnId = ?',
      whereArgs: [1],
    );
    return maps.first[columnIsLightTheme] == 1;
  }

  Future<void> updateCounter(int value) async {
    final db = await database;
    await db.update(
      tableName,
      {columnCounter: value},
      where: '$columnId = ?',
      whereArgs: [1],
    );
  }

  Future<void> updateThemePreference(bool isLight) async {
    final db = await database;
    await db.update(
      tableName,
      {columnIsLightTheme: isLight ? 1 : 0},
      where: '$columnId = ?',
      whereArgs: [1],
    );
  }
}