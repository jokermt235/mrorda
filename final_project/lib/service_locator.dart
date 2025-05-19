import 'package:get_it/get_it.dart';
import 'services/local_storage.dart';
import 'bloc/book_bloc.dart';
import 'bloc/cart_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<LocalStorage>(LocalStorage());
  await getIt<LocalStorage>().init();

  getIt.registerFactory(() => BookBloc());
  getIt.registerSingleton<CartBloc>(CartBloc(localStorage: getIt()));
}
