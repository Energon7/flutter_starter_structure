import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_routes.dart';
import '../core/error/error_screen.dart';
import '../features/home/view/home_page.dart';
import '../features/splash/view/splash_page.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRouteNames.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      message: state.error?.toString() ?? 'Routing error',
    ),
  );
}
