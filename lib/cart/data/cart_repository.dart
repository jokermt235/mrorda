import 'package:lesson9riverpod/data/database_storage.dart';
import 'package:lesson9riverpod/data/repository.dart';
import 'package:lesson9riverpod/data/storage.dart';

class CartRepository extends Repository{
  final Storage storage;
  CartRepository({required this.storage}){
    storage.int();
  }
}