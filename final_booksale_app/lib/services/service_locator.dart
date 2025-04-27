// lib/services/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // LocalStorage
  final localStorage = LocalStorage('final_booksale_app');
  await localStorage.ready;
  sl.registerLazySingleton<LocalStorage>(() => localStorage);

  // Add other services here later (e.g., API service)
}