import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_shopping/app/models/models.dart';
import 'package:flutter_shopping/utils/log_helper.dart';

import '../../../data/api_paths.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc() : super(ProductsListLoading()) {
    on<ProductsListStarted>(onStarted);
  }

  Future<void> onStarted(
    ProductsListStarted event,
    Emitter<ProductsListState> emit,
  ) async {
    emit(ProductsListLoading());

    try {
      final response = await http.get(Uri.parse(ApiPaths.apiBaseUrl + ApiPaths.products));

      if (response.statusCode == 200) {
        final productsData = ProductsListModel.fromJson(json.decode(response.body));
        emit(ProductsListLoaded(productsData.products));
      } else {
        emit(ProductsListError());
      }
    } catch (error, _) {
      Log.error(error);
      emit(ProductsListError());
    }
  }
}
