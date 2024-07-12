import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handiman_v0/core/themes/app_theme.dart';

//*1) provider se encarga de elegir el color del thema y obtener su referencia
final colorListProvider = Provider((ref) => colorListProviderReference);

//*2) el segundo provider stateProvider es para mantener una pieza de estado
//bool dark mode
final isDarkModeProvider = StateProvider((ref) => false);
//*3) int para seleccionar el color del thema con provider
final selectIndexColorProvider = StateProvider((ref) => 0);

//*4) provider del color extendemos del thema
final themeNotifierProvider =StateNotifierProvider<ThemeControllerNotifier, AppTheme>(
        (ref) => ThemeControllerNotifier());

//* controlador del statenotifierProvider
class ThemeControllerNotifier extends StateNotifier<AppTheme> {
  //inicia automaticamente al arrarncar la app con el thema por defecto
  ThemeControllerNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectColor: colorIndex);
  }
}
