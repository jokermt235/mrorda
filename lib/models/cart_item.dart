import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:book_sale_app/models/book.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends Equatable {
  @HiveField(0)
  final Book book;
  @HiveField(1)
  final int quantity;

  const CartItem({required this.book, required this.quantity});

  @override
  List<Object> get props => [book, quantity];
}
