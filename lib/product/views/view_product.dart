import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson9riverpod/cart/views/bloc/cart_bloc.dart';
import 'package:lesson9riverpod/cart/views/bloc/cart_event.dart';
import 'package:lesson9riverpod/cart/views/bloc/cart_state.dart';
import 'package:lesson9riverpod/product/data/product.dart';
import 'package:lesson9riverpod/product/providers/product_provider.dart';

class ViewProduct extends StatelessWidget{
  String? id;
  ViewProduct({this.id});
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context , ref , child){
      final AsyncValue<List<Product>> products = ref.watch(productProvider);
      return products.when(
          data: (productList){
            final product = productList.where((element)=>element.id.toString() == id).single;
            return Scaffold(
              appBar: AppBar(
                title: Text(product.title),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
                      child: Text(product.title, style: TextStyle(
                        fontWeight: FontWeight.w600
                      )),
                    ),
                    Container(
                      child: Image.network(
                          product!.image!
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: Text(
                        product.description
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Text(
                          "price : ${product.price.toString()} USD",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    BlocConsumer<CartBloc, CartState>(
                        builder: (context, state){
                          Future.delayed(Duration(seconds: 3), (){
                            if(context.mounted) {
                              context.read<CartBloc>().add(
                                  CartInitEvent(product: product));
                            }
                          });
                          return Container(
                            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                            child: ElevatedButton(
                              onPressed: (){
                                context.read<CartBloc>().add(CartAddEvent(product: product));
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child:Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(getText(state)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        listener: (context, state){}
                    )
                  ],
                ),
              ),
            );
          },
          error:(error, stack)=>Text("Product not found"),
          loading: (){
            return Center(
              child: CircularProgressIndicator()
            );
          }
      );
    });
  }

  String getText(CartState state){

    if(state is CartAddState){
      return state.count.toString();
    }

    if(state is CartInitState){
      return state.count.toString();
    }

    if(state is CartInitialState){
      return state.count.toString();
    }


    return "";
  }
  
}