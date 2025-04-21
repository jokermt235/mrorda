import 'package:book_store/core/services/service_locator.dart';
import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:book_store/features/home/presentation/bloc/home_bloc.dart';
import 'package:book_store/features/home/presentation/widgets/search_bar.dart';
import 'package:book_store/features/home/presentation/widgets/category_chooser.dart';
import 'package:book_store/features/home/presentation/widgets/book_grid.dart';
import 'package:book_store/features/cart/presentation/bloc/cart_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            bookRepository: locator.get<BookRepository>(),
          )..add(LoadBooksEvent()),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            cartRepository: locator.get<CartRepository>(),
          )..add(LoadCartEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Store'),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Badge(
                    label: Text(state.cartItems.length.toString()),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        context.go('/cart');
                      },
                    ),
                  );
                }
                return IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    context.go('/cart');
                  },
                );
              },
            ),
          ],
        ),
        body: const Column(
          children: [
            HomeSearchBar(),
            CategoryChooser(),
            Expanded(child: BookGrid()),
          ],
        ),
      ),
    );
  }
}