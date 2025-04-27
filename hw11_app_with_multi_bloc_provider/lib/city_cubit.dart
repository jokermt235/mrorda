import 'package:bloc/bloc.dart';

class CityCubit extends Cubit<String> {
  CityCubit() : super('');

  void updateCity(String city) {
    emit(city);
  }
}
