import 'package:get_it/get_it.dart';
import '../repositories/book_repository.dart';
import '../services/local_storage_service.dart';
import '../cubits/cart_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => BookRepository());
  sl.registerLazySingleton(() => LocalStorageService());
  sl.registerLazySingleton(() => CartCubit(sl<LocalStorageService>()));
}
