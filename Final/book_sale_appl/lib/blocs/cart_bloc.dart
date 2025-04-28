import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../storage/local_storage.dart';
import '../locator.dart';

class CartBloc extends Cubit<List<Book>> {
  CartBloc() : super([]);

  void loadCart() async {
    final savedCart = await locator<LocalStorage>().loadCart();
    emit(savedCart);
  }

  void addToCart(Book book) {
    final updatedCart = [...state, book];
    emit(updatedCart);
    locator<LocalStorage>().saveCart(updatedCart);
  }

  void removeFromCart(Book book) {
    final updatedCart = List<Book>.from(state)..remove(book);
    emit(updatedCart);
    locator<LocalStorage>().saveCart(updatedCart);
  }

  double get totalPrice {
    return state.fold(0, (sum, book) => sum + book.price);
  }
}
