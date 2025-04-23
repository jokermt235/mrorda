

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson9riverpod/cart/views/bloc/cart_bloc.dart';
import 'package:lesson9riverpod/cart/views/bloc/cart_state.dart';

class ViewCart extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Our cart"),
      ),
      body: BlocBuilder<CartBloc,CartState>(
          builder: (context, state){
            return Text("Cart here");
          }
      ),
    );
  }
}