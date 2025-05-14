import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/book/book_bloc.dart';

// Define a consistent theme for the app
ThemeData _buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      primary: Colors.teal,
      secondary: Colors.amber,
      surface: Colors.white,
      background: Colors.grey[100],
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // Explicitly set icon color
        size: 24,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  );
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // Explicitly set to ensure visibility
              size: 24,
            ),
            onPressed: () => context.go('/'),
            tooltip: 'Back to Home',
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return BlocBuilder<BookBloc, BookState>(
              builder: (context, bookState) {
                if (cartState is CartUpdated && bookState is BookLoaded) {
                  final cart = cartState.cart;
                  final books = bookState.books;
                  double totalPrice = 0;

                  if (cart.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_outlined,
                              size: 80, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('Your cart is empty.',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.go('/'),
                            child: Text('Browse Books'),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      ...cart.entries.map((entry) {
                        final book = books.firstWhere((b) => b.id == entry.key);
                        final count = entry.value;
                        totalPrice += book.price * count;

                        return Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                book.coverUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            title: Text(book.title,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                            subtitle: Text(
                                'Count: $count | Price: ${(book.price * count).toStringAsFixed(2)} \$'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/61/61138.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(DecreaseCartItem(book.id));
                                  },
                                  tooltip: 'Decrease',
                                ),
                                IconButton(
                                  icon: Image.network(
                                    'https://static.thenounproject.com/png/1649999-200.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AddToCart(book.id));
                                  },
                                  tooltip: 'Increase',
                                ),
                                IconButton(
                                  icon: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/3334/3334328.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveFromCart(book.id));
                                  },
                                  tooltip: 'Remove',
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 20),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '${totalPrice.toStringAsFixed(2)} \$',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Checkout not implemented yet!')),
                          );
                        },
                        child: Text('Proceed to Checkout'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
