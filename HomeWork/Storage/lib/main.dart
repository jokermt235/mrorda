import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'note.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());

  await Hive.openBox<Note>('notesBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HW11 Storage', home: HomeScreen());
  }
}
