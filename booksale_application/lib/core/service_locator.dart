import 'package:booksale_application/core/services/mock_book_database.dart';
import 'package:get_it/get_it.dart';
import '../../core/services/dio_client.dart';
import '../../core/services/local_storage_service.dart';
import '../../data/repositories/book_repository.dart';
import '../presentation/bloc/book/book_bloc.dart';
import '../presentation/bloc/cart/cart_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<LocalStorageService>(LocalStorageService());
  getIt.registerSingleton<MockBookDatabase>(MockBookDatabase());

  getIt.registerSingleton<BookRepository>(
    BookRepository(
      dio: getIt<DioClient>(),
      localStorage: getIt<LocalStorageService>(),
      mockDatabase: getIt<MockBookDatabase>(),
    ),
  );

  getIt.registerFactory<BookBloc>(() => BookBloc(getIt<BookRepository>()));
  getIt.registerFactory<CartBloc>(() => CartBloc(getIt<LocalStorageService>()));
}