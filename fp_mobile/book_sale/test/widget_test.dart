import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:book_store/main.dart';
import 'package:book_store/features/home/presentation/pages/home_page.dart';
import 'package:book_store/features/home/presentation/widgets/search_bar.dart';
import 'package:book_store/features/home/presentation/widgets/category_chooser.dart';
import 'package:book_store/features/home/presentation/widgets/book_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_store/features/home/presentation/bloc/home_bloc.dart';
import 'package:book_store/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:book_store/core/services/service_locator.dart';

void main() {
  setUpAll(() async {
    await setupLocator();
  });

  testWidgets('HomePage contains all main components', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              bookRepository: locator.get<BookRepository>(),
            )..add(LoadBooksEvent()),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: locator.get<CartRepository>(),
            )..add(LoadCartEvent()),
          ),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Wait for initial data to load
    await tester.pump();

    // Verify SearchBar exists
    expect(find.byType(HomeSearchBar), findsOneWidget);

    // Verify CategoryChooser exists
    expect(find.byType(CategoryChooser), findsOneWidget);

    // Verify BookGrid exists
    expect(find.byType(BookGrid), findsOneWidget);

    // Verify AppBar with title exists
    expect(find.text('Book Store'), findsOneWidget);

    // Verify Cart button exists
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });

  testWidgets('Search functionality works', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              bookRepository: locator.get<BookRepository>(),
            )..add(LoadBooksEvent()),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: locator.get<CartRepository>(),
            )..add(LoadCartEvent()),
          ),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pump();

    // Enter text in search field
    await tester.enterText(find.byType(TextField), 'Rules');
    await tester.pump();

    // Verify only matching books are shown
    expect(find.text('NO RULES RULES'), findsOneWidget);
    expect(find.text('PIXAR AND BEYOND'), findsNothing);
  });

  testWidgets('Category filtering works', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              bookRepository: locator.get<BookRepository>(),
            )..add(LoadBooksEvent()),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              cartRepository: locator.get<CartRepository>(),
            )..add(LoadCartEvent()),
          ),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pump();

    // Tap on Business category chip
    await tester.tap(find.text('Business'));
    await tester.pump();

    // Verify only Business books are shown
    expect(find.text('NO RULES RULES'), findsOneWidget);
    expect(find.text('PIXAR AND BEYOND'), findsNothing);
  });
}