import 'package:go_router/go_router.dart';
import 'package:go_router_example/screens/home_screen.dart';
import 'package:go_router_example/screens/profile_screen.dart';
import 'package:go_router_example/screens/settings_screen.dart';
import 'package:go_router_example/screens/products_screen.dart';
import 'package:go_router_example/screens/product_detail_screen.dart';
import 'route_names.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: RouteNames.profile,
          name: RouteNames.profile, // Добавляем имя
          builder: (context, state) {
            final userId = state.extra as String? ?? 'default_user';
            return ProfileScreen(userId: userId);
          },
        ),
        GoRoute(
          path: RouteNames.settings,
          name: RouteNames.settings,
          builder: (context, state) {
            final theme = state.extra as String? ?? 'light';
            return SettingsScreen(themePreference: theme);
          },
        ),
        GoRoute(
          path: RouteNames.products,
          name: RouteNames.products,
          builder: (context, state) => const ProductsScreen(),
          routes: [
            GoRoute(
              path: RouteNames.productDetail,
              name: RouteNames.productDetail,
              builder: (context, state) {
                final productId = state.pathParameters['id']!;
                final productName = state.uri.queryParameters['name'] ?? 'Unknown';
                return ProductDetailScreen(
                  productId: productId,
                  productName: productName,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);