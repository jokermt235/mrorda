import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/database/db_helper.dart';

class ThemeBloc extends Cubit<bool> {
  final DBHelper dbHelper;

  ThemeBloc(this.dbHelper) : super(true) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final isLight = await dbHelper.getThemePreference();
    emit(isLight);
  }

  Future<void> toggleTheme() async {
    final newValue = !state;
    emit(newValue);
    await dbHelper.updateThemePreference(newValue);
  }
}