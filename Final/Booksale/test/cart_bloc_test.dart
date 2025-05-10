import 'package:flutter_test/flutter_test.dart';
import 'package:hw12_booksale/cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

final sl = GetIt.instance;

void main() {
  late CartBloc cartBloc;

  setUp(() {
    sl.reset();
    final mockPrefs = MockSharedPreferences();
    when(() => mockPrefs.getStringList(any())).thenReturn([]);
    when(
      () => mockPrefs.setStringList(any(), any()),
    ).thenAnswer((_) async => true);
    sl.registerSingleton<SharedPreferences>(mockPrefs);

    cartBloc = CartBloc();
  });

  tearDown(() {
    cartBloc.close();
  });

  test('adds a book to the cart', () {
    // твой код теста
  });

  test('increases quantity when same book added', () {
    // твой код теста
  });

  // и так далее
}
