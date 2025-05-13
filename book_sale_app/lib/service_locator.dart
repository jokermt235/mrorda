import 'package:get_it/get_it.dart';
import 'services/book_service.dart';
import 'repositories/book_repository.dart';
import 'services/local_storage_service.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerLazySingleton<BookService>(() => BookService());
  sl.registerLazySingleton<BookRepository>(() => BookRepository(sl()));
  sl.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
}
