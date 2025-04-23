import 'package:lesson9riverpod/data/request.dart';
import 'package:lesson9riverpod/data/response.dart';

abstract class SetService{
  Future<Response> send(Request request);
}