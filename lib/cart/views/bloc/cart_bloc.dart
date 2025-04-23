

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson9riverpod/cart/data/cart_repository.dart';
import 'package:lesson9riverpod/data/repository.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  Repository repository;
  CartBloc({required this.repository}):super(CartInitState(0)) {
    on<CartAddEvent>((event,emit) async{
      final repo = repository as CartRepository;
      try {
        repo.storage.setData("cart", {"id" : event.product.id});
        var item = await repo.storage.getData("cart", {"id" : event.product.id});
        emit(CartAddState(item['count']));
      }catch(e){
        throw e.toString();
      }
    });
    on<CartInitEvent>((event,emit) async{
      final repo = repository as CartRepository;
      try {
        var item = await repo.storage.getData("cart", {"id" : event.product.id});
        emit(CartInitialState(item["count"]));
      }catch(e){
        throw e.toString();
      }
    });
  }
}