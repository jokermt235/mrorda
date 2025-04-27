import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/home_page.dart';
import '../pages/library_page.dart';
import '../pages/profile_page.dart';
import '../pages/settings_page.dart';
import '../pages/book_detail_page.dart';
import '../pages/book_reader_page.dart';
import '../pages/username_page.dart';
import '../blocs/username/username_cubit.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'library',
            name: 'library',
            builder: (context, state) => const LibraryPage(),
          ),
          GoRoute(
            path: 'profile/:userId',
            name: 'profile',
            builder: (context, state) {
              final userId = state.pathParameters['userId']!;
              return ProfilePage(userId: userId);
            },
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: 'book/:bookId',
            name: 'book',
            builder: (context, state) {
              final bookId = state.pathParameters['bookId']!;
              return BookDetailPage(bookId: bookId);
            },
          ),
          GoRoute(
            path: 'reader/:bookId',
            name: 'reader',
            builder: (context, state) {
              final bookId = state.pathParameters['bookId']!;
              return BookReaderPage(bookId: bookId);
            },
          ),
          GoRoute(
            path: 'username',
            name: 'username',
            builder: (context, state) => BlocProvider(
              create: (context) => UsernameCubit(),
              child: const UsernamePage(),
            ),
          ),
        ],
      ),
    ],
  );
});