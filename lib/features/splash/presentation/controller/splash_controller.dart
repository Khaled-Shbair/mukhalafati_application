import '/config/all_imports.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: AppConstants.durationSplashScreen),
      () {
        String route = _appSettingsSharedPreferences.getOnBoardingViewed()
            ? _appSettingsSharedPreferences.getRememberMeDriver()
                ? Routes.driverHomeScreen
                : _appSettingsSharedPreferences.getRememberMePolice()
                    ? Routes.policeManHomeScreen
                    : Routes.welcomeScreen
            : Routes.onBoardingScreen;
        Get.offAllNamed(route);
      },
    );
  }
}
