import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/book_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Map<int, String> chapters = {
    1: "Глава 1. Начало\n\nДавным-давно, в маленьком городке, жил-был человек, который мечтал о великих приключениях. Его дни были наполнены обычной жизнью, но в глубине души он знал — судьба приготовила для него нечто особенное.",
    2: "Глава 2. Первое испытание\n\nОднажды наш герой столкнулся с неожиданными трудностями. Ему пришлось принять важное решение, которое навсегда изменило его жизнь. На пути к мечте встречались как радостные, так и горькие моменты.",
    3: "Глава 3. Секреты прошлого\n\nВ старых книгах и записках он обнаружил таинственные секреты, которые раскрывали истину о его происхождении. С каждым новым открытием возрастало понимание собственной судьбы.",
    4: "Глава 4. На переломе судьбы\n\nПосле многих приключений и встреч с интересными персонажами его путь привел к важной развилке. Решения, принятые в этот момент, определяли дальнейшее развитие событий.",
    5: "Глава 5. Финал\n\nЗавершение великого путешествия оказалось одновременно и началом новой жизни. Герой обрел мудрость, силу и уверенность в завтрашнем дне, готовый делиться своим опытом с миром."
  };

  late final GoRouter _router = GoRouter(
    initialLocation: '/page/1',
    routes: [
      GoRoute(
        path: '/page/:pageNumber',
        builder: (context, state) {
          final pageNumber = int.tryParse(state.params['pageNumber'] ?? '1') ?? 1;
          final story = chapters[pageNumber] ?? "Нет данных для этой страницы.";
          return BookPage(
            pageNumber: pageNumber,
            story: story,
            chapters: chapters,
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Книга с рассказами',
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.black),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
