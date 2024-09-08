import 'all_imports.dart';

final instance = GetIt.instance();

initSplash() {
  Get.put<SplashController>(SplashController());
}

_disposeSplash() {
  Get.delete<SplashController>();
}

initOnBoarding() {
  _disposeSplash();
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}
