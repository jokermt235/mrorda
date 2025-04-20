import 'package:get_it/get_it.dart';
import 'blocs/cart_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerSingleton<CartCubit>(CartCubit());
}
