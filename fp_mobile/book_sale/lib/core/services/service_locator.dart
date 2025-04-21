import 'package:book_store/features/book/data/datasources/book_local_data_source_impl.dart';
import 'package:book_store/features/cart/data/datasources/cart_local_data_source_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_store/features/book/data/repositories/book_repository_impl.dart';
import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/book/data/datasources/book_local_data_source.dart';
import 'package:book_store/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:book_store/features/cart/data/datasources/cart_local_data_source.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  // Data sources
  locator.registerLazySingleton<BookLocalDataSource>(
    () => BookLocalDataSourceImpl(sharedPreferences: locator()),
  );
  
  locator.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: locator()),
  );

  // Repositories
  locator.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(localDataSource: locator()),
  );
  
  locator.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localDataSource: locator()),
  );
}