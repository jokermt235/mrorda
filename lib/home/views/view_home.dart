import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson9riverpod/catalog/views/components/catalog_card.dart';
import 'package:lesson9riverpod/home/views/components/home_search_input.dart';
import 'package:lesson9riverpod/my_cubit.dart';
import 'package:lesson9riverpod/product/data/product.dart';
import 'package:lesson9riverpod/product/providers/product_provider.dart';

class ViewHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit,String>(
        builder: (context, state){
          return Consumer(
              builder: (context, ref, child){
                final AsyncValue<List<Product>> products = ref.watch(productProvider);
                return Scaffold(
                  appBar: AppBar(
                    title: HomeSearchInput(
                      onChange: (value){
                        context.read<MyCubit>().setName(value);
                      },
                    ),
                    backgroundColor: Color(0xff37005E),
                    leading: PopupMenuButton(
                        icon: Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                        itemBuilder:(BuildContext context) => [
                          PopupMenuItem(
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart),
                                    Text("Cart")
                                  ],
                                ),
                                onTap: (){
                                  context.go('/cart');
                                },
                              )
                          )
                        ]
                    ),
                  ),
                  body: Container(
                    child: products.when(
                        data: (productListParam){

                          var productList = productListParam.where((product)=>product.title.contains(state));
                          return GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(8),
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            crossAxisCount: 3,
                            children: productList.map((product){
                              return CatalogCard(
                                data: product,
                                onClick: ()=>context.go("/product/${product.id}"),
                              );
                            }).toList(),
                          );
                        },
                        error: (err, _ )=>Text("Error $err"),
                        loading:  () {
                          return Center(
                              child:CircularProgressIndicator()
                          );
                        }
                    ),
                  ),
                );
              }
          );
        },
        listener: (context, state){
        });
  }
  
}