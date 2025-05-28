import 'package:get_it/get_it.dart';
import 'package:book_sale_app/services/book_service.dart';
import 'package:book_sale_app/services/cart_service.dart';
import 'package:book_sale_app/bloc/cart_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<BookService>(BookService());
  getIt.registerSingleton<CartService>(CartService());
  getIt.registerFactory<CartBloc>(() => CartBloc(getIt<CartService>()));
}

