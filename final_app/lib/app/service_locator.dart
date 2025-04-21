import '/features/book/bloc/book_bloc.dart';
import '/features/book/data/repositories/book_repository.dart';
import '/features/book/data/sources/local_book_source.dart';
import '/features/book/data/sources/remote_book_source.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => BookBloc(sl()));

  // Repository
  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(remoteSource: sl(), localSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<RemoteBookSource>(() => RemoteBookSourceImpl());
  sl.registerLazySingleton<LocalBookSource>(() => LocalBookSourceImpl());

  // External
  // await sl.registerSharedPreferences();
}