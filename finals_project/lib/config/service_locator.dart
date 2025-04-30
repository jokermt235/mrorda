import 'package:finals_project/features/books/bloc/book_bloc.dart';
import 'package:finals_project/features/books/bloc/cart_bloc.dart';
import 'package:finals_project/features/books/data/datasources/book_api_service.dart';
import 'package:finals_project/features/books/data/datasources/cart_local_storage.dart';
import 'package:finals_project/features/books/data/repositories/book_repository.dart';
import 'package:finals_project/features/books/data/repositories/cart_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Data sources
  getIt.registerLazySingleton<BookApiService>(() => BookApiService());
  getIt.registerLazySingleton<CartLocalStorage>(() => CartLocalStorage());

  // Repositories
  getIt.registerLazySingleton<BookRepository>(() => BookRepository(getIt()));
  getIt.registerLazySingleton<CartRepository>(() => CartRepository(getIt()));

  // Blocs
  getIt.registerFactory<BookBloc>(() => BookBloc(getIt()));
  getIt.registerFactory<CartBloc>(() => CartBloc(getIt()));
}
