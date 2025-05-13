import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/book/book_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';

// Define a consistent theme for the app
ThemeData _buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      primary: Colors.teal,
      secondary: Colors.amber,
      surface: Colors.white,
      background: Colors.grey[100],
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // Explicitly set icon color
        size: 24,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
  );
}

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Book Details'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // Explicitly set to ensure visibility
              size: 24,
            ),
            onPressed: () => context.go('/'),
            tooltip: 'Back to Home',
          ),
        ),
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoaded) {
              final book = state.books.firstWhere((b) => b.id == bookId);
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            book.coverUrl,
                            height: 250,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.error, size: 100),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      book.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text('Category: ${book.category}',
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 8),
                    Text('Pages: ${book.pageCount}',
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 8),
                    Text(
                      'Price: ${book.price} \$',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 24),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, cartState) {
                        int count = 0;
                        if (cartState is CartUpdated) {
                          count = cartState.cart[book.id] ?? 0;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text('Add to Cart'),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddToCart(book.id));
                              },
                            ),
                            Text('In Cart: $count',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
