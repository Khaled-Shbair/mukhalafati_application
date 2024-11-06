import 'package:dio/dio.dart';
import 'all_imports.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initDatabase();
  await _initSharedPreferences();
  await _initDio();
  await _initInterNetChecker();
}

Future<void> _initSharedPreferences() async {
  if (!GetIt.I.isRegistered<AppSettingsSharedPreferences>()) {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferences>(() => sharedPref);
    instance.registerLazySingleton<AppSettingsSharedPreferences>(
        () => AppSettingsSharedPreferences(instance()));
  }
}

Future<void> _initDio() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppApi>(() => AppApi(dio));
}

Future<void> _initInterNetChecker() async {
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(InternetConnection()));
}

Future<void> _initDatabase() async {
  await DatabaseProvider.initDatabase();
  if (!instance.isRegistered<ComplaintDatabaseController>()) {
    instance.registerLazySingleton<ComplaintDatabaseController>(
        () => ComplaintDatabaseController());
  }
  if (!instance.isRegistered<DriverDatabaseController>()) {
    instance.registerLazySingleton<DriverDatabaseController>(
        () => DriverDatabaseController());
  }
  if (!instance.isRegistered<PoliceDatabaseController>()) {
    instance.registerLazySingleton<PoliceDatabaseController>(
        () => PoliceDatabaseController());
  }
  if (!instance.isRegistered<TestResultDatabaseController>()) {
    instance.registerLazySingleton<TestResultDatabaseController>(
        () => TestResultDatabaseController());
  }
  if (!instance.isRegistered<ViolationsDatabaseController>()) {
    instance.registerLazySingleton<ViolationsDatabaseController>(
        () => ViolationsDatabaseController());
  }
  if (!instance.isRegistered<NotificationsDatabaseController>()) {
    instance.registerLazySingleton<NotificationsDatabaseController>(
        () => NotificationsDatabaseController());
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
  if (!GetIt.I.isRegistered<RemoteDriverLoginDataSource>()) {
    instance.registerLazySingleton<RemoteDriverLoginDataSource>(
        () => RemoteLoginDataSourceImplementation(
              instance<AppApi>(),
              instance<AppSettingsSharedPreferences>(),
            ));
  }
  if (!GetIt.I.isRegistered<DriverLoginRepository>()) {
    instance.registerLazySingleton<DriverLoginRepository>(
        () => DriverLoginRepositoryImplementation(
              instance<RemoteDriverLoginDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<DriverLoginUseCase>()) {
    instance.registerLazySingleton<DriverLoginUseCase>(
        () => DriverLoginUseCase(instance<DriverLoginRepository>()));
  }
  if (!GetIt.I.isRegistered<RemotePoliceManLoginDataSource>()) {
    instance.registerLazySingleton<RemotePoliceManLoginDataSource>(
        () => RemotePoliceManLoginDataSourceImpl(
              instance<AppApi>(),
              instance<AppSettingsSharedPreferences>(),
            ));
  }
  if (!GetIt.I.isRegistered<PoliceManLoginRepository>()) {
    instance.registerLazySingleton<PoliceManLoginRepository>(
        () => PoliceManLoginRepositoryImpl(
              instance<RemotePoliceManLoginDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<PoliceManLoginUseCase>()) {
    instance.registerLazySingleton<PoliceManLoginUseCase>(
        () => PoliceManLoginUseCase(instance<PoliceManLoginRepository>()));
  }
  Get.put<LoginController>(LoginController());
}

disposeLogin() {
  if (GetIt.I.isRegistered<RemoteDriverLoginDataSource>()) {
    instance.unregister<RemoteDriverLoginDataSource>();
  }
  if (GetIt.I.isRegistered<DriverLoginRepository>()) {
    instance.unregister<DriverLoginRepository>();
  }
  if (GetIt.I.isRegistered<DriverLoginUseCase>()) {
    instance.unregister<DriverLoginUseCase>();
  }
  if (GetIt.I.isRegistered<RemotePoliceManLoginDataSource>()) {
    instance.unregister<RemotePoliceManLoginDataSource>();
  }
  if (GetIt.I.isRegistered<PoliceManLoginRepository>()) {
    instance.unregister<PoliceManLoginRepository>();
  }
  if (GetIt.I.isRegistered<PoliceManLoginUseCase>()) {
    instance.unregister<PoliceManLoginUseCase>();
  }
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
  Get.put<DriverHomeController>(DriverHomeController());
}

disposeDriverHome() {
  Get.delete<DriverHomeController>();
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
  if (!GetIt.I.isRegistered<RemoteSendComplaintDataSource>()) {
    instance.registerLazySingleton<RemoteSendComplaintDataSource>(
        () => RemoteSendComplaintDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<SendComplaintRepository>()) {
    instance.registerLazySingleton<SendComplaintRepository>(
        () => SendComplaintRepositoryImpl(
              instance<RemoteSendComplaintDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<SendComplaintUseCase>()) {
    instance.registerLazySingleton<SendComplaintUseCase>(
        () => SendComplaintUseCase(instance<SendComplaintRepository>()));
  }
  Get.put<SendComplaintsController>(SendComplaintsController());
}

disposeCreateComplaints() {
  if (GetIt.I.isRegistered<RemoteSendComplaintDataSource>()) {
    instance.unregister<RemoteSendComplaintDataSource>();
  }
  if (GetIt.I.isRegistered<SendComplaintRepository>()) {
    instance.unregister<SendComplaintRepository>();
  }
  if (GetIt.I.isRegistered<SendComplaintUseCase>()) {
    instance.unregister<SendComplaintUseCase>();
  }
  Get.delete<SendComplaintsController>();
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
  disposeVerificationCode();
  disposeForgotPasswordForDriver();
  disposeForgotPasswordForPoliceMan();
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

initPayment() {
  Get.put<PaymentController>(PaymentController());
}

disposePayment() {
  Get.delete<PaymentController>();
}

initViolationPayment() {
  Get.put<ViolationPaymentController>(ViolationPaymentController());
}

disposeViolationPayment() {
  Get.delete<ViolationPaymentController>();
}

initNotification() {
  disposeDriverHome();
  Get.put<NotificationsController>(NotificationsController());
}

disposeNotification() {
  Get.delete<NotificationsController>();
}
