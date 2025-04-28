import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed(
                RouteNames.profile,
                extra: 'user123',
              ),
              child: const Text('Go to Profile'),
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(
                RouteNames.productDetail,
                pathParameters: {'id': 'prod_1'},
                queryParameters: {'name': 'Product 1'},
              ),
              child: const Text('View Product Detail Directly'),
            ),

            ElevatedButton(
              onPressed: () => context.pushNamed(RouteNames.products),
              child: const Text('View Products'),
            ),
          ],
        ),
      ),
    );
  }
}