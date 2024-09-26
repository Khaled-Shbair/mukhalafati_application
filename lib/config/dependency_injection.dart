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
  Get.put<PoliceManHomeController>(PoliceManHomeController());
  disposeLogin();
  disposeWelcome();
  disposeCreateViolation();
  disposeListOfViolations();
  disposeSearchForDriver();
  disposeLogout();
}

disposePoliceManHome() {
  Get.delete<PoliceManHomeController>();
}

initDriverHome() {
  disposeLogin();
  disposeWelcome();
  // Get.put<DriverHomeController>(DriverHomeController());
}

disposeDriverHome() {
  // Get.delete<DriverHomeController>();
}

initCreateViolation() {
  Get.put<CreateViolationController>(CreateViolationController());
  disposePoliceManHome();
  disposeListOfViolations();
  disposeSearchForDriver();
  disposeLogout();
}

disposeCreateViolation() {
  Get.delete<CreateViolationController>();
}

initListOfViolations() {
  Get.put<ListOfViolationsController>(ListOfViolationsController());
  disposePoliceManHome();
  disposeCreateViolation();
  disposeSearchForDriver();
  disposeLogout();
}

disposeListOfViolations() {
  Get.delete<ListOfViolationsController>();
}

initSearchForDriver() {
  Get.put<SearchForDriverController>(SearchForDriverController());
  disposePoliceManHome();
  disposeListOfViolations();
  disposeCreateViolation();
  disposeLogout();
}

disposeSearchForDriver() {
  Get.delete<SearchForDriverController>();
}

initSearchOnResultsTestsOfLicense() {
  Get.put<SearchOnResultsTestsOfLicenseController>(
      SearchOnResultsTestsOfLicenseController());
}

disposeSearchOnResultsTestsOfLicense() {
  Get.delete<SearchOnResultsTestsOfLicenseController>();
}

initLogout() {
  Get.put<LogoutController>(LogoutController());
}

disposeLogout() {
  Get.delete<LogoutController>();
}

initDrivingLicenseCard() {
  Get.put<DrivingLicenseCardController>(DrivingLicenseCardController());
}

disposeDrivingLicenseCard() {
  Get.delete<DrivingLicenseCardController>();
}

initListOfComplaints() {
  Get.put<ListOfComplaintsController>(ListOfComplaintsController());
}

disposeListOfComplaints() {
  Get.delete<ListOfComplaintsController>();
}

initCreateComplaints() {
  Get.put<CreateComplaintsController>(CreateComplaintsController());
}

disposeCreateComplaints() {
  Get.delete<CreateComplaintsController>();
}

initForgotPasswordForDriver() {
  Get.put<ForgotPasswordForDriverController>(
      ForgotPasswordForDriverController());
}

disposeForgotPasswordForDriver() {
  Get.delete<ForgotPasswordForDriverController>();
}

initForgotPasswordForPoliceMan() {
  Get.put<ForgotPasswordForPoliceManController>(
      ForgotPasswordForPoliceManController());
}

disposeForgotPasswordForPoliceMan() {
  Get.delete<ForgotPasswordForPoliceManController>();
}

initVerificationCode() {
  Get.put<VerificationCodeController>(VerificationCodeController());
}

disposeVerificationCode() {
  Get.delete<VerificationCodeController>();
}

initChangePassword() {
  Get.put<ChangePasswordController>(ChangePasswordController());
}

disposeChangePassword() {
  Get.delete<ChangePasswordController>();
}

initDriverProfile() {
  Get.put<DriverProfileController>(DriverProfileController());
}

disposeDriverProfile() {
  Get.delete<DriverProfileController>();
}
