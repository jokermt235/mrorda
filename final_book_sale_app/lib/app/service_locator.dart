import 'package:get_it/get_it.dart';
import 'package:final_book_sale_app/features/book/data/datasource/book_sqlite_data_source.dart';
import 'package:final_book_sale_app/features/book/data/repositories/book_repository_impl.dart';
import 'package:final_book_sale_app/features/book/domain/repositories/book_repository.dart';
import 'package:final_book_sale_app/features/book/domain/usecases/get_books.dart';
import 'package:final_book_sale_app/features/book/domain/usecases/SearchBook.dart';
import 'package:final_book_sale_app/features/book/presentation/bloc/book_bloc.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

final sl = GetIt.instance;

Future<Database> _initDatabase() async {
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final path = join(documentsDirectory.path, 'books.db');

  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE books(
          id TEXT PRIMARY KEY,
          title TEXT,
          author TEXT,
          coverImage TEXT,
          price REAL,
          category TEXT,
          pageCount INTEGER,
          description TEXT,
          samplePages TEXT
        )
      ''');
    },
    version: 1,
  );
}


Future<void> init() async {
  final database = await _initDatabase();
  sl.registerSingleton<Database>(database);

  // SQLite
  sl.registerLazySingleton<BookLocalDataSource>(
        () => BookSqliteDataSource(db: sl()),
  );

  // Репозиторий
  sl.registerLazySingleton<BookRepository>(
        () => BookRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetBooks(sl()));
  sl.registerLazySingleton(() => SearchBooksUseCase(sl()));

  // BLoC
  sl.registerFactory(
        () => BookBloc(
      getBooks: sl(),
      searchBooksUseCase: sl(),
    ),
  );
}