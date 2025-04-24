class Note {
  int? id;
  String title;
  String content;

  Note({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'content': content,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
