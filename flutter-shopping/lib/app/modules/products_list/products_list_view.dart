import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../db/drift/database.dart';
import '../../models/models.dart';
import '../cart/bloc/cart_bloc.dart';
import 'bloc/products_list_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: const Color(0xFF527cff),
        centerTitle: true,
        title: const Text(
          "Shopping Mall",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            constraints: const BoxConstraints(),
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                    if (state is CartLoaded && state.cartProducts.isNotEmpty)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Colors.red,
                          child: Text(
                            state.cartProducts.length.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            onPressed: () {
              context.push('/cart');
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductsListBloc, ProductsListState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductsListBloc>().add(ProductsListStarted());
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
                int crossAxisCount = isLandscape ? 3 : 2;

                if (state is ProductsListLoading) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                } 
                
                if (state is ProductsListError) {
                  return Center(
                    child: Text(
                      "Something went wrong",
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                } 
                
                if (state is ProductsListLoaded) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final currentProduct = state.products[index];
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            '/view/${currentProduct.id}'
                            '?title=${Uri.encodeComponent(currentProduct.title)}'
                            '&price=${currentProduct.price}'
                            '&thumbnail=${Uri.encodeComponent(currentProduct.thumbnail)}'
                            '&pages=${currentProduct.pages}',
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                              ),
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(-1, -1),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/product-placeholder.png",
                                    image: currentProduct.thumbnail,
                                    imageErrorBuilder: (context, error, stackTrace) {
                                      return Image.asset("assets/product-placeholder.png");
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        currentProduct.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    AddToCartButton(productItem: currentProduct),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          );
        },
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final ProductItem productItem;

  const AddToCartButton({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading || state is CartError) {
          return const SizedBox();
        }
        if (state is CartLoaded) {
          final isInCart = state.cartProducts.map((e) => e.id).contains(productItem.id);

          return IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 20,
            icon: Icon(
              isInCart ? Icons.check : Icons.shopping_cart,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {
              if (!isInCart) {
                context.read<CartBloc>().add(
                  CartItemAdded(
                    CartItemTblData(
                      id: productItem.id,
                      title: productItem.title,
                      createdAt: DateTime.now(),
                      featuredImage: productItem.thumbnail,
                      price: productItem.price,
                      description: productItem.description,
                    ),
                  ),
                );
              }
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
