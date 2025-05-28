import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_sale_app/models/book.dart';
import 'package:book_sale_app/models/cart_item.dart';
import 'package:book_sale_app/bloc/cart_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  const BookViewPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.network(
                    book.coverUrl,
                    height: 300.h,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 220),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(19.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    book.author,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Category: ${book.category}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Pages: ${book.pages}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    book.description ?? 'No description available',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16.h),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      int quantity = 0;
                      if (state is CartLoaded) {
                        final item = state.cartItems.firstWhere(
                          (item) => item.book.id == book.id,
                          orElse: () => CartItem(book: book, quantity: 0),
                        );
                        quantity = item.quantity;
                      }
                      return SizedBox(
                        height: 60.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              quantity == 0
                                  ? () {
                                    context.read<CartBloc>().add(
                                      AddToCart(
                                        CartItem(book: book, quantity: 1),
                                      ),
                                    );
                                  }
                                  : null,
                          child: Text(
                            'Buy Now for \$${book.price.toStringAsFixed(2)}',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
