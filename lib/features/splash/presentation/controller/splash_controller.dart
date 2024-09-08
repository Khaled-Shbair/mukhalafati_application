import '/config/all_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: Constants.durationSplashScreen),
      () {
        if (false) {
          Get.offAllNamed(Routes.onBoardingScreen);
        } else {
          Get.offAllNamed(Routes.onBoardingScreen);
        }
      },
    );
  }
}
