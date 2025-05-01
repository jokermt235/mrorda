import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'repositories/book_repository.dart';
import 'services/cart_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  sl.registerLazySingleton<CartService>(() => CartService(sl()));

  sl.registerLazySingleton<BookRepository>(() => BookRepository());
}