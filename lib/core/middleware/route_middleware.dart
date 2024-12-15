import '/config/all_imports.dart';

class RouteMiddleware {
  RouteMiddleware._();
  static String initialRoute() {
    if (SharedPreferencesController.getBool(
            SharedPreferencesKeys.viewOnBoarding) ==
        false) {
      return Routes.onBoardingScreen;
    } else if (SharedPreferencesController.getBool(
        SharedPreferencesKeys.rememberMeDriver)) {
      return Routes.driverHomeScreen;
    } else if (SharedPreferencesController.getBool(
        SharedPreferencesKeys.rememberMePolice)) {
      return Routes.policeManHomeScreen;
    } else {
      return Routes.welcomeScreen;
    }
  }
}
