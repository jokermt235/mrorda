import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book_bloc.dart';
import 'cart_bloc.dart';
import 'book_repository.dart';

final sl = GetIt.instance;

late SharedPreferences prefs;

Future<void> setupLocator() async {
  prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<BookRepository>(() => BookRepository());
  sl.registerLazySingleton<BookBloc>(() => BookBloc(sl<BookRepository>()));
  sl.registerLazySingleton<CartBloc>(() => CartBloc());
}
