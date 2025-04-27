import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartViewPage extends StatelessWidget {
  final Color pink1 = Color(0xFFFF90BB);
  final Color pink2 = Color(0xFFFFC1DA);
  final Color cream = Color(0xFFF8F8E1);
  final Color blue = Color(0xFF8ACCD5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: pink1)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: pink1),
        elevation: 0,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(child: Text('Your cart is empty.', style: TextStyle(fontSize: 18)));
          }

          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = state.cartItems[index];
              return Card(
                margin: EdgeInsets.only(bottom: 12),
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          cartItem.book.coverImage,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem.book.title,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: pink1)),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                _QuantityButton(
                                  icon: Icons.remove,
                                  color: blue,
                                  onPressed: () {
                                    context.read<CartBloc>().add(DecreaseQuantity(cartItem.book));
                                  },
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${cartItem.quantity}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                _QuantityButton(
                                  icon: Icons.add,
                                  color: blue,
                                  onPressed: () {
                                    context.read<CartBloc>().add(IncreaseQuantity(cartItem.book));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${cartItem.totalPrice.toStringAsFixed(2)} USD',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: Icon(Icons.delete, color: pink2),
                            onPressed: () {
                              context.read<CartBloc>().add(RemoveFromCart(cartItem.book));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${state.totalPrice.toStringAsFixed(2)} USD',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: pink1),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pink1,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {
                    // Handle checkout
                  },
                  child: Text('Checkout', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const _QuantityButton({required this.icon, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.2),
      child: IconButton(
        icon: Icon(icon, size: 18, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
