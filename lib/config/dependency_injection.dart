import 'all_imports.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  // _initSharedPreferences();
}

_initSharedPreferences() async {
  if (!GetIt.I.isRegistered<AppSettingsSharedPreferences>()) {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferences>(() => sharedPref);
    instance.registerLazySingleton<AppSettingsSharedPreferences>(
        () => AppSettingsSharedPreferences(instance()));
  }
}

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

_disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

initWelcome() {
  _disposeOnBoarding();
  Get.put<WelcomeController>(WelcomeController());
}

_disposeWelcome() {
  Get.delete<WelcomeController>();
}

initLogin() {
  _disposeOnBoarding();
  _disposeWelcome();
  Get.put<LoginController>(LoginController());
}

_disposeLogin() {
  Get.delete<LoginController>();
}
