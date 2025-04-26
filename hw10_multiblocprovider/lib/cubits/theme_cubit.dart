import 'package:bloc/bloc.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkMode: false));

  void toggleTheme() => emit(ThemeState(isDarkMode: !state.isDarkMode));
}
