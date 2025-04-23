import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson9riverpod/cart/views/view_cart.dart';
import 'package:lesson9riverpod/home/views/view_home.dart';
import 'package:lesson9riverpod/product/views/view_product.dart';

final GoRouter routerConf = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ViewHome();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'product/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'];
            return ViewProduct(id : id);
          },
        ),
        GoRoute(
          path: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return ViewCart();
          },
        ),
      ],
    ),
  ],
);