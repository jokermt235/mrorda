import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final Map<int, String> texts = {
    1: 'Жила-была в одной деревне девочка красоты невиданной: мать любила её без памяти, а бабушка и того больше.',
    2: 'Сшила как-то раз бабушка любимой внучке шапочку красного цвета и так сильно она девочке понравилась, что и снимать не хотелось. Всюду ходила она в своей шапочке, потому и стали называть её Красной Шапочкой.',
    3: 'Раз испекла мама пирожки и говорит своей дочке:',
    4: '— Сходи-ка ты навести бабушку, ей нездоровится. Да отнеси ей пирожки и горшочек масла. Смотри только в лесу не останавливайся и ни с кем не разговаривай.',
    5: 'Красная Шапочка была послушной девочкой, она сейчас же собралась и отправилась к бабушке, которая жила в другой деревне.',
  };

  static final GoRouter _router = GoRouter(
    initialLocation: '/1',
    routes: [
      GoRoute(
        path: '/:page',
        builder: (context, state) {
          final page = int.tryParse(state.pathParameters['page'] ?? '1') ?? 1;
          final text = texts[page] ?? 'Нет текста.';
          return StoryPage(page: page, text: text);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
