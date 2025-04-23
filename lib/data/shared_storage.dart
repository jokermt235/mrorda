import 'dart:convert';

import 'package:lesson9riverpod/data/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage extends Storage{
  SharedPreferences? prefs;
  @override
  Future<void> int() async{
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Future<Map<String, dynamic>> getData(String model, Map<String, dynamic> data) async {
    if(prefs == null){
      return {
        "error" : 1,
        "msg"  : "The storage is not ready"
      };
    }
    return jsonDecode(prefs!.getString(model) ?? '{}') as Map<String,dynamic>;
  }

  @override
  Future<void> setData(String model, Map<String, dynamic> data) async {
    prefs!.setString(model, jsonEncode(data));
  }
}