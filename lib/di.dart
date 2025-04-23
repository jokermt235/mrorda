import 'package:get_it/get_it.dart';
import 'package:lesson9riverpod/cart/data/cart_repository.dart';
import 'package:lesson9riverpod/data/database_storage.dart';
import 'package:lesson9riverpod/data/repository.dart';
import 'package:lesson9riverpod/data/storage.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async{
  sl.registerLazySingleton<Storage>(()=>DatabaseStorage());
  sl.registerLazySingleton<Repository>(()=>CartRepository(storage: sl()));
}
