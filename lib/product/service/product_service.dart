import 'package:dio/dio.dart';
import 'package:lesson9riverpod/data/request.dart';
import 'package:lesson9riverpod/services/get_service.dart';

class ProductService extends GetService{
  final Dio _dio = Dio();
  @override
  Future<Response> fetch(Request request) async{
    Response response = Response(requestOptions: RequestOptions());
    try {
      response = await _dio.get("https://fakestoreapi.com/products");
    }catch(e){
      throw Exception("The products cant be loaded!");
    }
    return response;
  }
}