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
            ? Routes.loginScreen
            : Routes.onBoardingScreen;
        Get.offAllNamed(route);
      },
    );
  }
}
