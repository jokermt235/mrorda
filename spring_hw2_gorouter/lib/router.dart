import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/page_a.dart';
import 'pages/page_b.dart';
import 'pages/page_c.dart';
import 'pages/page_d.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: '/page_a/:userId',
      builder: (BuildContext context, GoRouterState state) {
        String id = state.pathParameters['userId'] ?? 'no_id';
        return PageA(userId: id);
      },
    ),
    GoRoute(
      path: '/page_b',
      builder: (BuildContext context, GoRouterState state) {
        String? data = state.extra as String?;
        return PageB(someData: data ?? 'No data');
      },
    ),
    GoRoute(
      path: '/page_c',
      builder: (BuildContext context, GoRouterState state) {
        String queryValue = state.uri.queryParameters['value'] ?? '0';
        int number = int.tryParse(queryValue) ?? 0;
        return PageC(numericValue: number);
      },
    ),
    GoRoute(
      path: '/page_d/:itemId',
      builder: (BuildContext context, GoRouterState state) {
        String itemId = state.pathParameters['itemId'] ?? 'no_item';
        Map<String, dynamic>? otherData = state.extra as Map<String, dynamic>?;
        String desc = otherData?['description'] ?? 'No description';
        return PageD(itemId: itemId, description: desc);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: Text('Error')),
    body: Center(child: Text('Page not found')),
  ),
);