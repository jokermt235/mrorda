import 'dart:async';

class Product {
  final int id;
  final String name;
  final String description;

  Product(this.id, this.name, this.description);

  @override
  String toString() =>
      'Product(id: $id, name: $name, description: $description)';
}

class Database {
  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Product(1, 'Laptop', 'A high-performance laptop for gaming and work'),
      Product(2, 'Smartphone', 'A modern smartphone with great features'),
      Product(
        3,
        'Tablet',
        'A lightweight tablet for entertainment and productivity',
      ),
    ];
  }

  Future<Product> getProductById(int id) async {
    final products = await getProducts();
    await Future.delayed(Duration(seconds: 1));
    return products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Product not found'),
    );
  }
}

Future<int> simulateComputation() async {
  return Future.delayed(Duration(seconds: 3), () => 42);
}

void main() async {
  final database = Database();

  database
      .getProducts()
      .then((products) {
        print('Products loaded successfully:');
        for (var product in products) {
          print(' - $product');
        }
      })
      .catchError((e) {
        print('Failed to load products: $e');
      })
      .whenComplete(() {
        print('Finished loading products.');
      });

  try {
    final product = await database.getProductById(2);
    print('Found product: $product');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Product search completed.');
  }

  print('Starting a delayed computation...');
  simulateComputation()
      .then((result) {
        print('Computation result: $result');
      })
      .catchError((e) {
        print('Computation error: $e');
      });

  print('Main program continues executing...');
}
