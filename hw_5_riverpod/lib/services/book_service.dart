import '../models/book.dart';

class BookService {
  Future<Book> getQuoteBook() async {
    await Future.delayed(const Duration(seconds: 1));
    return Book(
      title: "Книга Притч",
      quotes: [
        "Умный молчит, когда глупый говорит.",
        "Маленькое доброе дело лучше большого намерения.",
        "Слушай, чтобы понять, а не чтобы ответить.",
        "Сила — в спокойствии, а не в крике.",
        "Тот, кто ищет смысл — всегда найдёт путь.",
        "Сначала слушай, потом — говори.",
      ],
    );
  }
}