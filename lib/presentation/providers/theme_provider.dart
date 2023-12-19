import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custom_form/config/theme/app_theme.dart';

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
