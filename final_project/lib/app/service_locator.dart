import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {

  getIt.registerSingleton(Dio(BaseOptions(
    connectTimeout: AppConstants.apiTimeout,
    receiveTimeout: AppConstants.apiTimeout,
  )));


  getIt.registerSingleton(await SharedPreferences.getInstance());
}