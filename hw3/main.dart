mixin ActionLogger {
  void logAction(String action) {
    print("Action Log: $action");
  }
  static void showLibraryNotice() {
    print("Library Notice: Please return books on time to avoid fines.");
  }
}
class LibraryMember with ActionLogger {
  String name;
  LibraryMember(this.name);
  void borrowBook(Book book) {
    if (book.isAvailable) {
      book.isAvailable = false;
      print("${name} borrowed the book ${book.title}");
    } else {
      logAction("The book ${book.title} is already borrowed.");
    }
  }
  void returnBook(Book book) {
    book.isAvailable = true;
    print("${name} returned the book ${book.title}");
  }
}
class Book {
  String title;
  bool isAvailable;
  Book(this.title) : isAvailable = true;
  void borrowBook(LibraryMember member) {
    member.borrowBook(this);
  }
  void returnBook(LibraryMember member) {
    member.returnBook(this);
  }
}
void main() {
  LibraryMember person1 = LibraryMember("Person 1");
  LibraryMember person2 = LibraryMember("Person 2");
  Book book1 = Book("Gone with the Wind");
  book1.borrowBook(person1);
  book1.borrowBook(person2);
  book1.returnBook(person1);
  book1.borrowBook(person2);
  ActionLogger.showLibraryNotice();
}