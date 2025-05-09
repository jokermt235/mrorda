import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/book.dart';
import 'screens/cart_view_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CartViewPage',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const CartViewPage(),
    );
  }
}