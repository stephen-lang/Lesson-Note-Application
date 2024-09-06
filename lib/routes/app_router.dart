import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lessonnote/pages/intro/intro_view.dart';
import 'package:lessonnote/routes/app_routes.dart';
import 'package:lessonnote/routes/app_nav_bar.dart';

class AppRouter {
  static GoRouter get router => _router;
  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
  static GlobalKey<NavigatorState> get mainMenuNavigatorKey =>
      _mainMenuNavigatorKey;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main-menu');

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: IntroView.routeName,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      // Route for HomePage without the bottom navigation bar
      GoRoute(
        name: IntroView.routeName,
        path: IntroView.routeName,
        builder: (_, state) => const IntroView(),
      ),
      // ShellRoute to persist the bottom navigation bar
      ShellRoute(
        navigatorKey: _mainMenuNavigatorKey,
        builder: (_, __, child) {
          return AppNavBar(child: child);
        },
        routes: <RouteBase>[
          ...AppRoutes.mainMenuRoutes,
          // Add more routes here as needed
        ],
      ),
    ],
  );
}
