import 'package:get_it/get_it.dart';
import 'services/book_service.dart';
import 'services/local_storage_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => BookService());
  sl.registerLazySingleton(() => LocalStorageService());
}