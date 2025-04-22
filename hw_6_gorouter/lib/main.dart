import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/quote_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<int, Map<String, String>> quotes = {
    1: {
      "quote": "The best way to get started is to quit talking and begin doing.",
      "author": "Walt Disney"
    },
    2: {
      "quote": "Don’t let yesterday take up too much of today.",
      "author": "Will Rogers"
    },
    3: {
      "quote": "It’s not whether you get knocked down, it’s whether you get up.",
      "author": "Vince Lombardi"
    },
    4: {
      "quote": "Success is not in what you have, but who you are.",
      "author": "Bo Bennett"
    },
    5: {
      "quote": "Believe you can and you’re halfway there.",
      "author": "Theodore Roosevelt"
    }
  };

  late final GoRouter _router = GoRouter(
    initialLocation: '/quote/1',
    routes: [
      GoRoute(
        path: '/quote/:pageNumber',
        builder: (context, state) {
          final pageNumber = int.tryParse(state.params['pageNumber'] ?? '1') ?? 1;
          final quoteData = quotes[pageNumber];
          return QuotePage(
            pageNumber: pageNumber,
            quote: quoteData?['quote'] ?? 'No quote found.',
            author: quoteData?['author'] ?? 'Unknown',
            total: quotes.length,
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Motivational Quotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}