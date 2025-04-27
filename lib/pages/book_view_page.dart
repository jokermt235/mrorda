import 'package:book_store2/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc/book_bloc.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/book.dart';
import '../widgets/book_view.dart';

class BookViewPage extends StatefulWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  State<BookViewPage> createState() => _BookViewPageState();
}

class _BookViewPageState extends State<BookViewPage> {
  Book? book;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    _loadBook();
    _loadCartQuantity();
  }

  void _loadBook() {
    final bookState = context.read<BookBloc>().state;
    if (bookState is BookLoaded) {
      final foundBook = bookState.books.firstWhere(
        (book) => book.id == widget.bookId,
        orElse: () => throw Exception('Book not found'),
      );
      setState(() {
        book = foundBook;
      });
    }
  }

  void _loadCartQuantity() {
    final cartState = context.read<CartBloc>().state;
    if (cartState is CartLoaded) {
      final cartItem = cartState.cartItems.firstWhere(
        (item) => item.book.id == widget.bookId,
        orElse: () => CartItem(book: Book(
          id: '',
          title: '',
          author: '',
          category: '',
          description: '',
          price: 0,
          pages: 0,
          coverUrl: '',
          samplePages: [],
        )),
      );
      setState(() {
        quantity = cartItem.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (book == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(book!.title),
      ),
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartLoaded) {
            final cartItem = state.cartItems.firstWhere(
              (item) => item.book.id == widget.bookId,
              orElse: () => CartItem(book: Book(
                id: '',
                title: '',
                author: '',
                category: '',
                description: '',
                price: 0,
                pages: 0,
                coverUrl: '',
                samplePages: [],
              )),
            );
            setState(() {
              quantity = cartItem.quantity;
            });
          }
        },
        child: BookView(
          book: book!,
          quantity: quantity,
          onAddToCart: () {
            context.read<CartBloc>().add(AddToCart(book: book!));
          },
          onRemoveFromCart: () {
            context.read<CartBloc>().add(RemoveFromCart(bookId: widget.bookId));
          },
          onDecreaseQuantity: () {
            context.read<CartBloc>().add(DecreaseQuantity(bookId: widget.bookId));
          },
        ),
      ),
    );
  }
}