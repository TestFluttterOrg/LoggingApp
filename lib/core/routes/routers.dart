import 'package:go_router/go_router.dart';
import 'package:logging_app/core/routes/app_routes.dart';
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
    ],
  );
}
