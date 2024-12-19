import '/config/all_imports.dart';

class ThemeService {
  ThemeService._();

  void changeTheme(bool isDarkMode) {
    SharedPreferencesController.setData(
        SharedPreferencesKeys.darkTheme, isDarkMode);
    if (isDarkMode) {
      Get.changeTheme(managerDarkTheme());
    } else {
      Get.changeTheme(managerLightTheme());
    }
  }

  static ThemeMode get themeMode {
    if (SharedPreferencesController.getBool(SharedPreferencesKeys.darkTheme)) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  static ThemeData get themeData {
    if (SharedPreferencesController.getBool(SharedPreferencesKeys.darkTheme)) {
      return managerDarkTheme();
    } else {
      return managerLightTheme();
    }
  }

  static ThemeData get darkTheme => managerDarkTheme();
}
