import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:book_sales/features/books/widgets/book_grid.dart';
import 'package:book_sales/features/books/widgets/book_search_bar.dart';
import 'package:book_sales/features/books/widgets/category_chooser.dart';
import 'package:book_sales/features/cart/bloc/cart_bloc.dart';
import 'package:book_sales/features/cart/bloc/cart_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Sales'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart),
                    if (state.totalItems > 0)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${state.totalItems}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  GoRouter.of(context).push('/cart');
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          BookSearchBar(),
          CategoryChooser(),
          Expanded(child: BookGrid()),
        ],
      ),
    );
  }
}