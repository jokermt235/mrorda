import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/modules/products_list/products_list_view.dart';
import '../../app/modules/cart/cart_view.dart';
import '../../app/modules/products_list/view_book_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductListView(),
    ),
    GoRoute(
      path: '/view/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? ''; 
        final title = state.queryParameters['title'] ?? '';
        final price = double.tryParse(state.queryParameters['price'] ?? '0') ?? 0;
        final thumbnail = state.queryParameters['thumbnail'] ?? '';
        final pages = int.tryParse(state.queryParameters['pages'] ?? '0') ?? 0;

        return ViewBookPage(
          id: id,
          title: title,
          price: price,
          thumbnail: thumbnail,
          pages: pages,
        );
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartView(), 
    ),
  ],
);
