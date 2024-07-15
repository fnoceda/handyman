import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/core/config/router/app_router_notifier_provider.dart';
import 'package:handiman_v0/feacture/screens/onboarding_screen/onboarding_screen.dart';
import 'package:handiman_v0/feacture/screens/splash_screen/splash_screen.dart';



final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: goRouterNotifier,
    routes: [
      //* Primera Pantalla
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
});
