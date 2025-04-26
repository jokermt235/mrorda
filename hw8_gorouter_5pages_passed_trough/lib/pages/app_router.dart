import 'package:go_router/go_router.dart';
import 'home_page.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/page1/:message',
      builder: (context, state) {
        final message = state.pathParameters['message']!;
        return Page1(message: message);
      },
    ),
    GoRoute(
      path: '/page2/:number',
      builder: (context, state) {
        final number = state.pathParameters['number']!;
        return Page2(number: number);
      },
    ),
    GoRoute(
      path: '/page3/:text',
      builder: (context, state) {
        final text = state.pathParameters['text']!;
        return Page3(text: text);
      },
    ),
    GoRoute(
      path: '/page4/:text',
      builder: (context, state) {
        final text = state.pathParameters['text']!;
        return Page4(text: text);
      },
    ),
    GoRoute(
      path: '/page5/:info',
      builder: (context, state) {
        final info = state.pathParameters['info']!;
        return Page5(info: info);
      },
    ),
  ],
);
