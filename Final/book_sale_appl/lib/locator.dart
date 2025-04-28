import 'package:book_sale_appl/services/book_service.dart';
import 'package:get_it/get_it.dart';
import 'storage/local_storage.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BookService());
  locator.registerLazySingleton(() => LocalStorage());
}
