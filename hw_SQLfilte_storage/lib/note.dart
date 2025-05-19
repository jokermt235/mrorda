class Note {
  final int? id;
  final String content;

  Note({this.id, required this.content});

  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content};
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'] as int?, content: map['content'] as String);
  }
}
