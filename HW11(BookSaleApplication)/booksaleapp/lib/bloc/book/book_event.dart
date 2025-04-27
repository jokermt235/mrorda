abstract class BookEvent {}

class LoadBooks extends BookEvent {}
class SearchBooks extends BookEvent {
  final String query;
  SearchBooks(this.query);
}