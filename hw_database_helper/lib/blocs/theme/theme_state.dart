part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isLight;

  const ThemeState._(this.isLight);

  const ThemeState.light() : this._(true);
  const ThemeState.dark() : this._(false);

  @override
  List<Object> get props => [isLight];
}