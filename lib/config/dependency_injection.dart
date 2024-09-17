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

disposeSplash() {
  Get.delete<SplashController>();
}

initOnBoarding() {
  disposeSplash();
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

initWelcome() {
  disposeOnBoarding();
  Get.put<WelcomeController>(WelcomeController());
}

disposeWelcome() {
  Get.delete<WelcomeController>();
}

initLogin() {
  disposeOnBoarding();
  disposeWelcome();
  Get.put<LoginController>(LoginController());
}

disposeLogin() {
  Get.delete<LoginController>();
}

initPoliceManHome() {
  disposeLogin();
  disposeWelcome();
  Get.put<PoliceManHomeController>(PoliceManHomeController());
}

disposePoliceManHome() {
  Get.delete<PoliceManHomeController>();
}
initDriverHome() {
  disposeLogin();
  disposeWelcome();
  // Get.put<PoliceManHomeController>(PoliceManHomeController());
}

disposeDriverHome() {
  // Get.delete<PoliceManHomeController>();
}