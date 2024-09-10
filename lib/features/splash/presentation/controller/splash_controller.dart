import '/config/all_imports.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences = instance();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: AppConstants.durationSplashScreen),
      () {
        if (_appSettingsSharedPreferences.getOnBoardingViewed()) {
          Get.offAllNamed(Routes.onBoardingScreen);
        } else {
          Get.offAllNamed(Routes.loginScreen);
        }
      },
    );
  }
}
