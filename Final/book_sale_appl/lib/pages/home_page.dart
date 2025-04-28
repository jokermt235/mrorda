// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../blocs/book_bloc.dart';
// import '../models/book.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late TextEditingController _searchController;
//   String? selectedCategory; // Выбранная категория
//   List<String> allCategories = []; // ВСЕ категории (запоминаем один раз)

//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();

//     // Получить все категории при старте
//     final bookBloc = BlocProvider.of<BookBloc>(context);
//     allCategories = bookBloc.getCategories();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _onCategorySelected(String? category, BookBloc bookBloc) {
//     setState(() {
//       selectedCategory = category;
//     });
//     if (category == null) {
//       bookBloc.loadBooks();
//     } else {
//       bookBloc.filterByCategory(category);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bookBloc = context.read<BookBloc>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Store'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               context.go('/cart');
//             },
//             icon: const Icon(Icons.shopping_cart),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Поисковая строка
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search books...',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     _onCategorySelected(null, bookBloc); // Очистить фильтр
//                   },
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               onChanged: (query) {
//                 if (query.isEmpty) {
//                   _onCategorySelected(null, bookBloc);
//                 } else {
//                   setState(() {
//                     selectedCategory = null; // Снимаем выделение категории
//                   });
//                   bookBloc.searchBooks(query);
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             // Горизонтальный список категорий
//             SizedBox(
//               height: 40,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: allCategories.length,
//                 itemBuilder: (context, index) {
//                   final category = allCategories[index];
//                   final isSelected = selectedCategory == category;

//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             isSelected ? Colors.blue : Colors.grey[300],
//                         foregroundColor:
//                             isSelected ? Colors.white : Colors.black,
//                       ),
//                       onPressed: () {
//                         _onCategorySelected(category, bookBloc);
//                       },
//                       child: Text(category),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Сетка книг
//             Expanded(
//               child: BlocBuilder<BookBloc, List<Book>>(
//                 builder: (context, books) {
//                   if (books.isEmpty) {
//                     return const Center(child: Text('No books found.'));
//                   }
//                   return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                           childAspectRatio: 0.65,
//                           crossAxisSpacing: 8,
//                           mainAxisSpacing: 8,
//                         ),
//                     itemCount: books.length,
//                     itemBuilder: (context, index) {
//                       final book = books[index];
//                       return GestureDetector(
//                         onTap: () {
//                           context.go('/book', extra: book);
//                         },
//                         child: Card(
//                           elevation: 4,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(8),
//                                   child: Image.asset(
//                                     book.coverUrl,
//                                     fit: BoxFit.cover,
//                                     alignment:
//                                         Alignment
//                                             .center, // <-- выравниваем по центру
//                                     width: double.infinity,
//                                     height: double.infinity,
//                                   ),
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   book.title,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/book_bloc.dart';
import '../models/book.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  String? selectedCategory; // Выбранная категория
  List<String> allCategories = []; // ВСЕ категории (запоминаем один раз)

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    // Получить все категории при старте
    final bookBloc = BlocProvider.of<BookBloc>(context);
    allCategories = bookBloc.getCategories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String? category, BookBloc bookBloc) {
    setState(() {
      selectedCategory = category;
    });
    if (category == null) {
      bookBloc.loadBooks();
    } else {
      bookBloc.filterByCategory(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookBloc = context.read<BookBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Поисковая строка
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search books...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _onCategorySelected(null, bookBloc); // Очистить фильтр
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  _onCategorySelected(null, bookBloc);
                } else {
                  setState(() {
                    selectedCategory = null; // Снимаем выделение категории
                  });
                  bookBloc.searchBooks(query);
                }
              },
            ),
            const SizedBox(height: 16),
            // Горизонтальный список категорий как ссылки
            SizedBox(
              height: 50, // Высота для кнопок категорий
              child: Wrap(
                alignment: WrapAlignment.center, // Центрируем кнопки
                spacing: 8.0,
                children:
                    allCategories.map((category) {
                      final isSelected = selectedCategory == category;

                      return TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: isSelected
                                  ? Colors.deepPurple
                                  : Colors.black, textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight
                                        .normal, // Изменяем вес текста при выборе
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                        ),
                        onPressed: () {
                          _onCategorySelected(category, bookBloc);
                        },
                        child: Text(category),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Сетка книг
            Expanded(
              child: BlocBuilder<BookBloc, List<Book>>(
                builder: (context, books) {
                  if (books.isEmpty) {
                    return const Center(child: Text('No books found.'));
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return GestureDetector(
                        onTap: () {
                          context.go('/book', extra: book);
                        },
                        child: Card(
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    book.coverUrl,
                                    fit: BoxFit.cover,
                                    alignment:
                                        Alignment
                                            .center, // <-- выравниваем по центру
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  book.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
