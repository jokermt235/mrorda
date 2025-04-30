import 'package:finals_project/features/books/bloc/cart_bloc.dart';
import 'package:finals_project/features/books/presentation/widgets/book_grid.dart';
import 'package:finals_project/features/books/presentation/widgets/category_chooser.dart';
import 'package:finals_project/features/books/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = 0;
              if (state is CartLoaded) {
                itemCount =
                    state.cartItems.fold(0, (sum, item) => sum + item.quantity);
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => context.go('/cart'),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
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
                          itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          BookSearchBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CategoryChooser(),
          ),
          SizedBox(height: 8),
          BookGrid(),
        ],
      ),
    );
  }
}
