class DataModel {
  final int? id;
  final String data;

  DataModel({this.id, required this.data});

  // Преобразование модели в Map (для вставки в базу данных)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
    };
  }

  // Преобразование Map в модель (для получения данных из базы)
  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      data: map['data'],
    );
  }
}
