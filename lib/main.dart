import 'dart:async';
import 'package:flutter/material.dart';
import 'package:handiman_v0/core/config/environment/environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/core/config/router/app_router.dart';
import 'package:handiman_v0/core/themes/app_theme.dart';
import 'package:handiman_v0/core/themes/theme_provider.dart';


Future<void> main() async {
  await Environment.initEnvirionment();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Handyman example',    
      theme: appTheme.getTheme(),
    );
  }
}
