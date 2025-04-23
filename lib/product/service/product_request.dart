import 'package:lesson9riverpod/data/request.dart';

class ProductRequest extends Request{
  Map<String,dynamic>? data;
  @override
  void setData(Map<String, dynamic> data) {
    this.data = data;
  }

}