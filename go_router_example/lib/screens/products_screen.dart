import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/route_names.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final productId = 'prod_${index + 1}';
          final productName = 'Product ${index + 1}';

          return ListTile(
            title: Text(productName),
            onTap: () => context.pushNamed(
              RouteNames.productDetail,
              pathParameters: {'id': productId},
              queryParameters: {'name': productName},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}