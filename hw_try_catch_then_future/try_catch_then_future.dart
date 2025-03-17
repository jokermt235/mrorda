import 'dart:async';

void main() {
  fetchProductData().then((productData) {
    print('Product data: $productData');
  }).catchError((error) {
    print('An error occurred while fetching product data: $error');
  }).whenComplete(() {
    print('Product data fetching process is complete.');
  });
}

Future<String> fetchProductData() async {
  try {
    await Future.delayed(Duration(seconds: 3));

    if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
      throw 'Network error: Failed to fetch product data';
    }

    return 'Product data successfully retrieved: Product name - Laptop, Price - \$799';
  } catch (error) {
    rethrow;  
  }
}
