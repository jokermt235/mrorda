import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/user/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return UserPage(id: id);
      },
    ),
    GoRoute(
      path: '/product/:productId',
      builder: (context, state) {
        final productId = state.pathParameters['productId']!;
        return ProductPage(productId: productId);
      },
    ),
    GoRoute(
      path: '/settings/:tab',
      builder: (context, state) {
        final tab = state.pathParameters['tab']!;
        return SettingsPage(tab: tab);
      },
    ),
    GoRoute(
      path: '/summary/:userId/:productId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        final productId = state.pathParameters['productId']!;
        return SummaryPage(userId: userId, productId: productId);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/user/42'),
              child: const Text("Go to User 42"),
            ),
            ElevatedButton(
              onPressed: () => context.go('/product/100'),
              child: const Text("Go to Product 100"),
            ),
            ElevatedButton(
              onPressed: () => context.go('/settings/notifications'),
              child: const Text("Go to Settings - Notifications"),
            ),
            ElevatedButton(
              onPressed: () => context.go('/summary/42/100'),
              child: const Text("Go to Summary (User 42, Product 100)"),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  final String id;
  const UserPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Page")),
      body: Center(child: Text("User ID: $id")),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Page")),
      body: Center(child: Text("Product ID: $productId")),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final String tab;
  const SettingsPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Page")),
      body: Center(child: Text("Current Tab: $tab")),
    );
  }
}

class SummaryPage extends StatelessWidget {
  final String userId;
  final String productId;
  const SummaryPage({super.key, required this.userId, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Summary Page")),
      body: Center(
        child: Text("User ID: $userId\nProduct ID: $productId"),
      ),
    );
  }
}

