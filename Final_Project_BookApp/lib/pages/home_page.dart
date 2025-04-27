import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_state.dart';
import '../pages/cart_view_page.dart';

class HomePage extends StatelessWidget {
  final Color pink1 = Color(0xFFFF90BB);
  final Color pink2 = Color(0xFFFFC1DA);
  final Color cream = Color(0xFFF8F8E1);
  final Color blue = Color(0xFF8ACCD5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        title: Text('Book Store', style: TextStyle(color: pink1)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: pink1),
      ),
      body: BlocConsumer<BookBloc, BookState>(
        listener: (context, state) {
          if (state is BookError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error loading books')),
            );
          }
        },
        builder: (context, state) {
          if (state is BookLoading) {
            return Center(child: CircularProgressIndicator(color: pink1));
          } else if (state is BookLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        book.coverImage,
                        height: 50,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      '«${book.title}»',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: pink1),
                    ),
                    subtitle: Text(
                      book.category,
                      style: TextStyle(color: blue),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: pink2, size: 18),
                    onTap: () {
                      context.push('/book', extra: book);
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No books available', style: TextStyle(color: Colors.grey)));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pink1,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartViewPage()),
          );
        },
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
