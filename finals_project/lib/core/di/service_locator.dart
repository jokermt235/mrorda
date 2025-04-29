import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../features/shared/data/repositories/book_repository.dart';
import '../../features/shared/domain/presentation/blocs/cart_bloc.dart';
import '../../features/shared/domain/presentation/blocs/book_bloc.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton<Dio>(() => Dio());

  // Repositories
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(dio: sl()));

  // Blocs
  sl.registerFactory(() => BookBloc(repository: sl()));
  sl.registerFactory(() => CartBloc());
}
