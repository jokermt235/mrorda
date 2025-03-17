import 'dart:async';

void main() async {

  print('1. Пример try-catch:');
  basicTryCatch();

  print('\n2. Пример Future с then:');
  await basicFuture();

  print('\n3. Пример Future с try-catch:');
  await futureTryCatch();

  print('\n4. Пример async/await:');
  await asyncAwaitExample();
}

void basicTryCatch() {
  try {
    int result = 10 ~/ 0;
    print("Результат: $result");
  } catch (e) {
    print("Поймана ошибка: $e");
  } finally {
    print("Блок finally всегда выполняется");
  }
}

Future<void> basicFuture() {
  print("Загрузка данных...");

  Completer completer = Completer();

  Future.delayed(Duration(seconds: 2))
      .then((_) {
        return "Данные успешно загружены!";
      })
      .then((value) {
        print(value);
        completer.complete();
      })
      .catchError((error) {
        print("Ошибка: $error");
        completer.complete();
      });

  return completer.future;
}

Future<void> futureTryCatch() {
  Completer completer = Completer();
  print("Начинаем обработку...");

  try {
    Future.delayed(Duration(seconds: 1))
        .then((_) {
          if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
            throw Exception("Случайная ошибка!");
          }
          print("Операция успешно выполнена!");
          completer.complete();
        })
        .catchError((error) {
          print("Поймана ошибка внутри Future: $error");
          completer.complete();
        });
  } catch (e) {
    print("Внешний catch: $e");
    completer.complete();
  }

  return completer.future;
}

Future<void> asyncAwaitExample() async {
  print("Выполнение async функции...");

  try {
    await Future.delayed(Duration(seconds: 2));
    print("Async операция успешно завершена!");

    await Future.delayed(Duration(seconds: 1));
    print("Прошла еще 1 секунда.");

    int randomNumber = DateTime.now().millisecondsSinceEpoch % 10;
    if (randomNumber > 7) {
      throw Exception("Произошла случайная ошибка! ($randomNumber > 7)");
    }
  } catch (e) {
    print("Ошибка в async функции: $e");
  }
}
