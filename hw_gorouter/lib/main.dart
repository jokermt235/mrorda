import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/chapter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<int, String> chapters = {
    1: "Chapter 1: The Beginning\n\nOnce upon a time, in a small village, lived a boy who dreamed of adventure.",
    2: "Chapter 2: The Challenge\n\nHe faced a challenge that would forever change his life.",
    3: "Chapter 3: Discovery\n\nThrough old books, he discovered secrets of his origin.",
    4: "Chapter 4: The Turning Point\n\nHis journey led him to a place where he had to make a great choice.",
    5: "Chapter 5: The New Dawn\n\nHe emerged stronger, ready to begin a new life with wisdom and courage.",
  };

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(chapters: chapters),
      ),
      GoRoute(
        path: '/chapter/:number',
        builder: (context, state) {
          final number = int.tryParse(state.params['number'] ?? '1') ?? 1;
          final story = chapters[number] ?? 'No story available.';
          return ChapterPage(chapterNumber: number, story: story, chapters: chapters);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'StoryBook',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}