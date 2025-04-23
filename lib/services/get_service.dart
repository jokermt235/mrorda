import 'package:dio/dio.dart';
import 'package:lesson9riverpod/data/request.dart';

abstract class GetService{
  Future<Response> fetch(Request request);
}