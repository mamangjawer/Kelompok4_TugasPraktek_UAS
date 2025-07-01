import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newshive/views/main_screen.dart';
import '../views/introduction_screen.dart';
import '../views/login_screen.dart';
import '../views/register_screen.dart';
import '../views/splash_screen.dart';
import '../views/detail_screen.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  static AppRouter get instance => _instance;

  factory AppRouter() {
    _instance.goRouter = goRouterSetup();

    return _instance;
  }

  GoRouter? goRouter;

  static GoRouter goRouterSetup() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: RouteNames.splash,
          pageBuilder: (context, state) => MaterialPage(child: SplashScreen()),
        ),
        GoRoute(
          path: "/intro",
          name: RouteNames.introduction,
          pageBuilder:
              (context, state) => MaterialPage(child: IntroductionScreen()),
        ),
        GoRoute(
          path: '/login',
          name: RouteNames.login,
          pageBuilder: (context, state) => MaterialPage(child: LoginScreen()),
          routes: [
            GoRoute(
              path: "/register",
              name: RouteNames.register,
              pageBuilder: (_, __) => MaterialPage(child: RegisterScreen()),
            ),
          ],
        ),
        GoRoute(
          path: '/main',
          name: RouteNames.main,
          pageBuilder: (context, state) => MaterialPage(child: MainScreen()),
        ),
      ],
    );
  }
}
