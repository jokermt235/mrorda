abstract class Storage{
  Future<void> int();
  Future<Map<String, dynamic>> getData(String model, Map<String, dynamic> data);
  Future<void> setData(String model, Map<String, dynamic> data);
}