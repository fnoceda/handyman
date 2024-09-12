import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/core/config/router/app_router_notifier_provider.dart';
import 'package:handiman_v0/features/auth/presentation/screens/login_screen.dart';
import 'package:handiman_v0/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:handiman_v0/features/initial_loading/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:handiman_v0/features/initial_loading/presentation/screens/splash_screen/prueba_precios.dart';
import 'package:handiman_v0/features/initial_loading/presentation/screens/splash_screen/splash_screen.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    initialLocation: '/pruebas',
    refreshListenable: goRouterNotifier,
    routes: [
      //pruebas
      GoRoute(
        path: '/pruebas',
        builder: (context, state) => const PruebaPrecios(),
      ),
      //* Primera Pantalla
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
       GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
});
