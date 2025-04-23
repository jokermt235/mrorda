import 'dart:io';
import 'package:lesson9riverpod/data/storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseStorage extends Storage{
  Database? db;
  @override
  Future<void> int() async{

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS){
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = await _getDatabasePath();
    db = await databaseFactory.openDatabase(dbPath);
    _initDatabase();
  }

  Future<String> _getDatabasePath() async{

    Directory dbDir;

    if (Platform.isAndroid || Platform.isIOS) {
      dbDir = await getApplicationDocumentsDirectory();
    } else {
      dbDir = await getApplicationSupportDirectory();
    }

    return join(dbDir.path, "local_app.db");
  }

  @override
  Future<Map<String, dynamic>> getData(String model, Map<String, dynamic> data) async {
    List<Map<String, dynamic>>  results = await db!.rawQuery("SELECT * FROM $model WHERE product_id = ? ", [
      data["id"]
    ]);
    return results.first;
  }
  @override
  Future<void> setData(String model, Map<String, dynamic> data) async {
    if(db != null) {
      List<Map<String, dynamic>>  results = await db!.rawQuery("SELECT * FROM $model WHERE product_id = ? ", [
        data["id"]
      ]);

      if(results.isEmpty){
        db!.insert(model, {"product_id" : data["id"], "count" : 1});
      }else{
        Map<String, dynamic> record = results.first;
        var count =  record["count"] + 1;
        
        db!.update(
          model,
          {"count" : count },
          where: 'product_id = ?',
          whereArgs: [data["id"]]
        );
      }
    }
  }

  void _initDatabase(){
    try {
      db!.execute(
          "CREATE TABLE IF NOT EXISTS cart(id INTEGER PRIMARY KEY, count INTEGER, product_id INTEGER)");
    }on Exception catch (_, e){
      print(e);
    }
  }

}