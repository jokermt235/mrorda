import 'package:finals_project/features/shared/data/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem {
  final BookModel book;
  final int quantity;

  CartItem({required this.book, required this.quantity});
}

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get totalPrice =>
      items.fold(0, (total, item) => total + (item.book.price * item.quantity));
}

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final BookModel book;

  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final BookModel book;

  RemoveFromCart(this.book);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>((event, emit) {
      final items = List<CartItem>.from(state.items);
      final index = items.indexWhere((item) => item.book.id == event.book.id);

      if (index != -1) {
        // Если книга уже в корзине, увеличиваем количество
        final updatedItem = CartItem(
          book: items[index].book,
          quantity: items[index].quantity + 1,
        );
        items[index] = updatedItem;
      } else {
        // Если книга новая — добавляем в корзину
        items.add(CartItem(book: event.book, quantity: 1));
      }

      // Обновляем состояние корзины
      emit(CartState(items: items));
    });

    on<RemoveFromCart>((event, emit) {
      final items = List<CartItem>.from(state.items);
      final index = items.indexWhere((item) => item.book.id == event.book.id);

      if (index != -1) {
        // Если количество больше 1, уменьшаем количество
        final current = items[index];
        if (current.quantity > 1) {
          items[index] = CartItem(
            book: current.book,
            quantity: current.quantity - 1,
          );
        } else {
          // Если количество 1, удаляем элемент
          items.removeAt(index);
        }

        // Обновляем состояние корзины
        emit(CartState(items: items));
      }
    });
  }
}
