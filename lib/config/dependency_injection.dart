import 'all_imports.dart';

final instance = GetIt.instance();

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}
