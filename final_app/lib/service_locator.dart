import 'package:get_it/get_it.dart';
import 'bloc/book_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'services/book_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => BookService());
  sl.registerLazySingleton(() => BookCubit(sl()));
  sl.registerLazySingleton(() => CartCubit());
}
