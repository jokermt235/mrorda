import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/database_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  List<Product> products = [];

  void _loadProducts() async {
    final data = await DatabaseService.getProducts();
    setState(() {
      products = data;
    });
  }

  void _addProduct() async {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    if (name.isNotEmpty && price > 0) {
      await DatabaseService.addProduct(Product(name: name, price: price));
      _nameController.clear();
      _priceController.clear();
      _loadProducts();
    }
  }

  void _deleteProduct(int id) async {
    await DatabaseService.deleteProduct(id);
    _loadProducts();
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Shop')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
          ),
          ElevatedButton(
            onPressed: _addProduct,
            child: const Text('Add Product'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text('${product.name} - \$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteProduct(product.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
