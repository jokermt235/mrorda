import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksaleapp/bloc/cart/cart_bloc.dart';
import 'package:booksaleapp/bloc/cart/cart_event.dart';
import 'package:booksaleapp/bloc/cart/cart_state.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final items = state.items.values.toList();
          final total = items.fold<double>(
            0,
            (sum, it) => sum + it.book.price * it.count,
          );

          if (items.isEmpty) {
            return const Center(child: Text('Ваша корзина пуста'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (ctx, i) {
                    final it = items[i];
                    final b = it.book;
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          b.imageAsset,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(b.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('Цена: \$${b.price.toStringAsFixed(2)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => context.read<CartBloc>().add(RemoveFromCart(b)),
                          ),
                          Text('${it.count}', style: const TextStyle(fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => context.read<CartBloc>().add(AddToCart(b)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text('Итого:', style: TextStyle(fontSize: 18)),
                    const Spacer(),
                    Text('\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
