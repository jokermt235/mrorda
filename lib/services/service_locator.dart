import 'package:get_it/get_it.dart';
import '../repositories/book_repository.dart';
import '../repositories/cart_repository.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Services
  sl.registerSingleton<ApiService>(ApiService());
  sl.registerSingleton<LocalStorageService>(LocalStorageService());

  // Repositories
  sl.registerSingleton<BookRepository>(
    BookRepository(apiService: sl<ApiService>()),
  );
  sl.registerSingleton<CartRepository>(
    CartRepository(localStorageService: sl<LocalStorageService>()),
  );

  // BLoCs will be registered in the widgets where they're used
}