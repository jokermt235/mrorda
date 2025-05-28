import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_sale_app/bloc/cart_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: Text('Cart', style: TextStyle(fontSize: 20.sp)),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            if (state.cartItems.isEmpty) {
              return Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 16.sp)));
            }
            double total = state.cartItems.fold(
              0,
              (sum, item) => sum + (item.book.price * item.quantity),
            );
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.network(
                                  item.book.coverUrl,
                                  width: 60.w,
                                  height: 80.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.broken_image, size: 60.sp),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.book.title,
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16.sp),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      '\$${item.book.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF4074D8),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove_circle,
                                              color: const Color(0xFF4074D8), size: 24.sp),
                                          onPressed: () {
                                            context.read<CartBloc>().add(
                                                  UpdateCartQuantity(
                                                    item.book.id,
                                                    item.quantity - 1,
                                                  ),
                                                );
                                          },
                                        ),
                                        Text('${item.quantity}', style: TextStyle(fontSize: 16.sp)),
                                        IconButton(
                                          icon: Icon(Icons.add_circle,
                                              color: const Color(0xFF4074D8), size: 24.sp),
                                          onPressed: () {
                                            context.read<CartBloc>().add(
                                                  UpdateCartQuantity(
                                                    item.book.id,
                                                    item.quantity + 1,
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: const Color(0xFF757575), size: 24.sp),
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        RemoveFromCart(item.book.id),
                                      );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF4074D8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text('Checkout', style: TextStyle(fontSize: 16.sp)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Error loading cart', style: TextStyle(fontSize: 16.sp)));
        },
      ),
    );
  }
}