import 'package:go_router/go_router.dart';
import 'package:weather_flutter/features/splash/presentation/pages/splash_page.dart';
import 'package:weather_flutter/features/weather/presentation/pages/weather_page.dart';

class AppRouter {
  static const splash = 'splash';
  static const weather = 'weather';
  static const about = 'about';
}

final router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRouter.splash,
        path: "/",
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: AppRouter.weather,
        path: "/${AppRouter.weather}",
        builder: (context, state) => const WeatherPage(),
      )
    ],
    errorBuilder: (context, state) {
      return SplashPage();
    });
