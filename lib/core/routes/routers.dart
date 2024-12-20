import 'package:go_router/go_router.dart';
import 'package:logging_app/core/routes/app_routes.dart';
import 'package:logging_app/feature/presentation/log_history/log_history_screen.dart';
import 'package:logging_app/feature/presentation/main/main_screen.dart';
import 'package:logging_app/feature/presentation/splash/splash_screen.dart';

class Routes {
  Routes._();

  static final routers = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      //Splash
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (_, __) {
          return const SplashScreen();
        },
      ),
      //Main
      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        builder: (_, __) {
          return const MainScreen();
        },
      ),
      //Log History
      GoRoute(
        path: AppRoutes.logHistory,
        name: AppRoutes.logHistory,
        builder: (_, __) {
          return const LogHistoryScreen();
        },
      ),
    ],
  );
}
