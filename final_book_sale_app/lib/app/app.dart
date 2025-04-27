import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_book_sale_app/app/app_router.dart';
import 'package:final_book_sale_app/app/service_locator.dart';

class BookSaleApp extends StatelessWidget {
  BookSaleApp({super.key}) {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Sale App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}