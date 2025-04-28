import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/book/book_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../models/book.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Sale'),
//         actions: [
//           IconButton(
//             // icon: const Icon(Icons.shopping_cart),
//             icon: Image.network('https://cdn-icons-png.flaticon.com/512/649/649931.png'),
//             onPressed: () {
//               context.go('/cart');
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search books...',
//                 // prefixIcon: Icon(Icons.search),
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.all(8.0), // Чтобы немного уменьшить картинку по размеру
//                   child: Image.network('https://static-00.iconduck.com/assets.00/search-icon-2048x2048-cmujl7en.png', width: 20, height: 20),
//                 ),
//                 border: const OutlineInputBorder(),
//               ),
//               onChanged: (query) {
//
//                 // Здесь можно фильтровать книги по названию, если хочешь
//               },
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<BookBloc, BookState>(
//               builder: (context, state) {
//                 if (state is BookLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is BookLoaded) {
//                   return GridView.builder(
//                     padding: const EdgeInsets.all(8),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.6,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: state.books.length,
//                     itemBuilder: (context, index) {
//                       final book = state.books[index];
//                       return GestureDetector(
//                         onTap: () {
//                           context.go('/view-book/${book.id}');
//                         },
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: Image.network(book.coverUrl, fit: BoxFit.cover),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis),
//                             Text('${book.price} \$', style: const TextStyle(fontWeight: FontWeight.bold)),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(child: Text('Failed to load books.'));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = ""; // Переменная для хранения поискового запроса

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Sale'),
        actions: [
          IconButton(
            icon: Image.network('https://cdn-icons-png.flaticon.com/512/649/649931.png'),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://static-00.iconduck.com/assets.00/search-icon-2048x2048-cmujl7en.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BookLoaded) {
                  // find book
                  final filteredBooks = state.books.where((book) {
                    return book.title.toLowerCase().contains(searchQuery.toLowerCase());
                  }).toList();

                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = filteredBooks[index];
                      return GestureDetector(
                        onTap: () {
                          context.go('/view-book/${book.id}');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(book.coverUrl, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 8),
                            Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                            Text('${book.price} \$', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('Failed to load books.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
