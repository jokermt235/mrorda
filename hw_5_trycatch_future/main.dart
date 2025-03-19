import 'dart:async';

void main() async {
  print('1. Демонстрация обработки ошибок с помощью try-catch:');
  demonstrateTryCatch();

  print('\n2. Использование Future с then для асинхронной обработки:');
  await demonstrateFuture();

  print('\n3. Использование try-catch внутри Future:');
  await futureWithErrorHandling();

  print('\n4. Пример работы с async/await:');
  await demonstrateAsyncAwait();
}

void demonstrateTryCatch() {
  try {
    int divisionResult = 20 ~/ 0;
    print("Результат деления: $divisionResult");
  } catch (error) {
    print("Ошибка: $error");
  } finally {
    print("Этот блок выполняется всегда, независимо от ошибок");
  }
}

Future<void> demonstrateFuture() {
  print("Запуск асинхронной операции...");

  var taskCompletion = Completer();

  Future.delayed(Duration(seconds: 2))
      .then((_) {
        return "Загрузка завершена успешно!";
      })
      .then((message) {
        print(message);
        taskCompletion.complete();
      })
      .catchError((error) {
        print("Проблема при загрузке: $error");
        taskCompletion.complete();
      });

  return taskCompletion.future;
}

Future<void> futureWithErrorHandling() {
  var taskCompletion = Completer();
  print("Начало выполнения задачи...");

  try {
    Future.delayed(Duration(seconds: 1))
        .then((_) {
          if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
            throw Exception("Ошибка, случайно произошедшая в процессе!");
          }
          print("Задача выполнена успешно!");
          taskCompletion.complete();
        })
        .catchError((error) {
          print("Обработана ошибка внутри Future: $error");
          taskCompletion.complete();
        });
  } catch (e) {
    print("Внешняя ошибка: $e");
    taskCompletion.complete();
  }

  return taskCompletion.future;
}

Future<void> demonstrateAsyncAwait() async {
  print("Запуск async/await...");

  try {
    await Future.delayed(Duration(seconds: 2));
    print("Асинхронная операция завершена успешно!");

    await Future.delayed(Duration(seconds: 1));
    print("Прошла еще 1 секунда.");

    int generatedNumber = DateTime.now().millisecondsSinceEpoch % 10;
    if (generatedNumber > 7) {
      throw Exception("Ошибка: случайное число больше 7 ($generatedNumber)");
    }
  } catch (e) {
    print("Произошла ошибка: $e");
  }
}

