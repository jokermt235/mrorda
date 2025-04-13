import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/profile.dart';

class ProfilesCubit extends Cubit<List<Profile>> {
  ProfilesCubit() : super([]);

  void addProfile(Profile profile) {
      final updatedList = List<Profile>.from(state);
      updatedList.add(profile);
      print('Добавлен профиль: ${profile.name}, ${profile.age}'); 
      emit(updatedList);
  }

}