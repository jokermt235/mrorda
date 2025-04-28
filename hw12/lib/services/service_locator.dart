import 'package:get_it/get_it.dart';
import '../repositories/book_repository.dart';
import '../blocs/book/book_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<BookRepository>(() => BookRepository());
  getIt.registerFactory(() => BookBloc(getIt()));
  getIt.registerFactory(() => CartBloc());
}
