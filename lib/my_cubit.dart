import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<String>{
  String? name;
  MyCubit({this.name}):super("Name default");

  void setName(String name){
    emit(name);
  }
}