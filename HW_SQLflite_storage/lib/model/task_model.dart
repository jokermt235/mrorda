// lib/model/task_model.dart
class Task {
  final int? id;
  final String title;

  Task({this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
    );
  }
}
