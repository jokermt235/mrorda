import 'package:get_it/get_it.dart';
import 'data/book_service.dart';
import 'blocs/book/book_bloc.dart';
import 'blocs/cart/cart_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerLazySingleton<BookService>(() => BookService());
  sl.registerFactory(() => BookBloc(sl()));
  sl.registerFactory(() => CartBloc());
}
