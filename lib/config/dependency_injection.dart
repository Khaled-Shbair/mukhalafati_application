import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'all_imports.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _initSharedPreferences();
  SharedPreferencesController.init();
  await _initDio();
  await _initFirebase();
  await _initInterNetChecker();
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();
  await FbNotifications.initNotifications();
  await FbNotifications.requestNotificationPermissions();
  FbNotifications.initializeForegroundNotificationForAndroid();
  FbNotifications.manageNotificationAction();
  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
}
//
// Future<void> _initSharedPreferences() async {
//   SharedPreferencesController().init();
//   if (!GetIt.I.isRegistered<SharedPreferencesController>()) {
//     final SharedPreferences sharedPref = await SharedPreferences.getInstance();
//     instance.registerLazySingleton<SharedPreferences>(() => sharedPref);
//     instance.registerLazySingleton<SharedPreferencesController>(
//         () => SharedPreferencesController(instance()));
//   }
// }

Future<void> _initDio() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppApi>(() => AppApi(dio));
}

Future<void> _initInterNetChecker() async {
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(InternetConnection()));
}

initOnBoarding() {
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
        () => RemoteLoginDataSourceImpl(instance<AppApi>()));
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
        () => RemotePoliceManLoginDataSourceImpl(instance<AppApi>()));
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
  if (!GetIt.I.isRegistered<RemoteCreateViolationDataSource>()) {
    instance.registerLazySingleton<RemoteCreateViolationDataSource>(
        () => RemoteCreateViolationDataSourceImpl(
              instance<AppApi>(),
            ));
  }
  if (!GetIt.I.isRegistered<CreateViolationRepository>()) {
    instance.registerLazySingleton<CreateViolationRepository>(
        () => CreateViolationRepositoryImpl(
              instance<RemoteCreateViolationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<CreateViolationUseCase>()) {
    instance.registerLazySingleton<CreateViolationUseCase>(
        () => CreateViolationUseCase(instance<CreateViolationRepository>()));
  }
  disposePoliceManHome();
  disposeListOfViolations();
  disposeSearchForDriver();
  disposeLogout();
  Get.put<CreateViolationController>(CreateViolationController());
}

disposeCreateViolation() {
  if (GetIt.I.isRegistered<RemoteCreateViolationDataSource>()) {
    instance.unregister<RemoteCreateViolationDataSource>();
  }
  if (GetIt.I.isRegistered<CreateViolationRepository>()) {
    instance.unregister<CreateViolationRepository>();
  }
  if (GetIt.I.isRegistered<CreateViolationUseCase>()) {
    instance.unregister<CreateViolationUseCase>();
  }
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
  if (!GetIt.I.isRegistered<RemoteSearchForDriverDataSource>()) {
    instance.registerLazySingleton<RemoteSearchForDriverDataSource>(
        () => RemoteSearchForDriverDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<SearchForDriverRepository>()) {
    instance.registerLazySingleton<SearchForDriverRepository>(
        () => SearchForDriverRepositoryImpl(
              instance<RemoteSearchForDriverDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<SearchForDriverUseCase>()) {
    instance.registerLazySingleton<SearchForDriverUseCase>(
        () => SearchForDriverUseCase(instance<SearchForDriverRepository>()));
  }

  Get.put<SearchForDriverController>(SearchForDriverController());
  disposePoliceManHome();
  disposeListOfViolations();
  disposeCreateViolation();
  disposeLogout();
}

disposeSearchForDriver() {
  if (GetIt.I.isRegistered<RemoteSearchForDriverDataSource>()) {
    instance.unregister<RemoteSearchForDriverDataSource>();
  }
  if (GetIt.I.isRegistered<SearchForDriverRepository>()) {
    instance.unregister<SearchForDriverRepository>();
  }
  if (GetIt.I.isRegistered<SearchForDriverUseCase>()) {
    instance.unregister<SearchForDriverUseCase>();
  }
  Get.delete<SearchForDriverController>();
}

initSearchOnResultsTestsOfLicense() {
  if (!GetIt.I.isRegistered<RemoteSearchOnResultsTestsOfLicenseDataSource>()) {
    instance
        .registerLazySingleton<RemoteSearchOnResultsTestsOfLicenseDataSource>(
            () => RemoteSearchOnResultsTestsOfLicenseDataSourceImpl(
                instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<SearchOnResultsTestsOfLicenseRepository>()) {
    instance.registerLazySingleton<SearchOnResultsTestsOfLicenseRepository>(
        () => SearchOnResultsTestsOfLicenseRepositoryImpl(
              instance<RemoteSearchOnResultsTestsOfLicenseDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<SearchForDriverUseCase>()) {
    instance.registerLazySingleton<SearchOnResultsTestsOfLicenseUseCase>(() =>
        SearchOnResultsTestsOfLicenseUseCase(
            instance<SearchOnResultsTestsOfLicenseRepository>()));
  }

  Get.put<SearchOnResultsTestsOfLicenseController>(
      SearchOnResultsTestsOfLicenseController());
}

disposeSearchOnResultsTestsOfLicense() {
  if (GetIt.I.isRegistered<RemoteSearchOnResultsTestsOfLicenseDataSource>()) {
    instance.unregister<RemoteSearchOnResultsTestsOfLicenseDataSource>();
  }
  if (GetIt.I.isRegistered<SearchOnResultsTestsOfLicenseRepository>()) {
    instance.unregister<SearchOnResultsTestsOfLicenseRepository>();
  }
  if (GetIt.I.isRegistered<SearchOnResultsTestsOfLicenseUseCase>()) {
    instance.unregister<SearchOnResultsTestsOfLicenseUseCase>();
  }
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
  if (!GetIt.I.isRegistered<RemoteGetAllComplaintsDataSource>()) {
    instance.registerLazySingleton<RemoteGetAllComplaintsDataSource>(
        () => RemoteGetAllComplaintsDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<GetAllComplaintsRepository>()) {
    instance.registerLazySingleton<GetAllComplaintsRepository>(
        () => GetAllComplaintsRepositoryImpl(
              instance<RemoteGetAllComplaintsDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<GetAllComplaintsUseCase>()) {
    instance.registerLazySingleton<GetAllComplaintsUseCase>(
        () => GetAllComplaintsUseCase(instance<GetAllComplaintsRepository>()));
  }
  Get.put<ListOfComplaintsController>(ListOfComplaintsController());
}

disposeListOfComplaints() {
  if (GetIt.I.isRegistered<RemoteGetAllComplaintsDataSource>()) {
    instance.unregister<RemoteGetAllComplaintsDataSource>();
  }
  if (GetIt.I.isRegistered<GetAllComplaintsRepository>()) {
    instance.unregister<GetAllComplaintsRepository>();
  }
  if (GetIt.I.isRegistered<GetAllComplaintsUseCase>()) {
    instance.unregister<GetAllComplaintsUseCase>();
  }
  Get.delete<ListOfComplaintsController>();
}

initCreateComplaints() {
  if (!GetIt.I.isRegistered<RemoteCreateComplaintDataSource>()) {
    instance.registerLazySingleton<RemoteCreateComplaintDataSource>(
        () => RemoteCreateComplaintDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<CreateComplaintRepository>()) {
    instance.registerLazySingleton<CreateComplaintRepository>(
        () => CreateComplaintRepositoryImpl(
              instance<RemoteCreateComplaintDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<CreateComplaintUseCase>()) {
    instance.registerLazySingleton<CreateComplaintUseCase>(
        () => CreateComplaintUseCase(instance<CreateComplaintRepository>()));
  }
  Get.put<CreateComplaintsController>(CreateComplaintsController());
}

disposeCreateComplaints() {
  if (GetIt.I.isRegistered<RemoteCreateComplaintDataSource>()) {
    instance.unregister<RemoteCreateComplaintDataSource>();
  }
  if (GetIt.I.isRegistered<CreateComplaintRepository>()) {
    instance.unregister<CreateComplaintRepository>();
  }
  if (GetIt.I.isRegistered<CreateComplaintUseCase>()) {
    instance.unregister<CreateComplaintUseCase>();
  }
  Get.delete<CreateComplaintsController>();
}

initForgotPasswordForDriver() {
  if (!GetIt.I.isRegistered<RemoteDriverForgotPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteDriverForgotPasswordDataSource>(
        () => RemoteDriverForgotPasswordDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<DriverForgotPasswordRepository>()) {
    instance.registerLazySingleton<DriverForgotPasswordRepository>(
        () => DriverForgotPasswordRepositoryImpl(
              instance<RemoteDriverForgotPasswordDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<DriverForgotPasswordUseCase>()) {
    instance.registerLazySingleton<DriverForgotPasswordUseCase>(() =>
        DriverForgotPasswordUseCase(
            instance<DriverForgotPasswordRepository>()));
  }
  Get.put<ForgotPasswordForDriverController>(
      ForgotPasswordForDriverController());
}

disposeForgotPasswordForDriver() {
  if (GetIt.I.isRegistered<RemoteDriverForgotPasswordDataSource>()) {
    instance.unregister<RemoteDriverForgotPasswordDataSource>();
  }
  if (GetIt.I.isRegistered<DriverForgotPasswordRepository>()) {
    instance.unregister<DriverForgotPasswordRepository>();
  }
  if (GetIt.I.isRegistered<DriverForgotPasswordUseCase>()) {
    instance.unregister<DriverForgotPasswordUseCase>();
  }
  Get.delete<ForgotPasswordForDriverController>();
}

initForgotPasswordForPoliceMan() {
  if (!GetIt.I.isRegistered<RemotePoliceManForgotPasswordDataSource>()) {
    instance.registerLazySingleton<RemotePoliceManForgotPasswordDataSource>(
        () => RemotePoliceManForgotPasswordDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<PoliceManForgotPasswordRepository>()) {
    instance.registerLazySingleton<PoliceManForgotPasswordRepository>(
        () => PoliceManForgotPasswordRepositoryImpl(
              instance<RemotePoliceManForgotPasswordDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<PoliceManForgotPasswordUseCase>()) {
    instance.registerLazySingleton<PoliceManForgotPasswordUseCase>(() =>
        PoliceManForgotPasswordUseCase(
            instance<PoliceManForgotPasswordRepository>()));
  }
  Get.put<ForgotPasswordForPoliceManController>(
      ForgotPasswordForPoliceManController());
}

disposeForgotPasswordForPoliceMan() {
  if (GetIt.I.isRegistered<RemotePoliceManForgotPasswordDataSource>()) {
    instance.unregister<RemotePoliceManForgotPasswordDataSource>();
  }
  if (GetIt.I.isRegistered<PoliceManForgotPasswordRepository>()) {
    instance.unregister<PoliceManForgotPasswordRepository>();
  }
  if (GetIt.I.isRegistered<PoliceManForgotPasswordUseCase>()) {
    instance.unregister<PoliceManForgotPasswordUseCase>();
  }
  Get.delete<ForgotPasswordForPoliceManController>();
}

initVerificationCode() {
  Get.put<VerificationCodeController>(VerificationCodeController());
}

disposeVerificationCode() {
  Get.delete<VerificationCodeController>();
}

initDriverChangePassword() {
  if (!GetIt.I.isRegistered<RemoteDriverChangePasswordDataSource>()) {
    instance.registerLazySingleton<RemoteDriverChangePasswordDataSource>(
        () => RemoteDriverChangePasswordDataSourceImpl(
              instance<AppApi>(),
            ));
  }
  if (!GetIt.I.isRegistered<DriverChangePasswordRepository>()) {
    instance.registerLazySingleton<DriverChangePasswordRepository>(
      () => DriverChangePasswordRepositoryImpl(
          instance<RemoteDriverChangePasswordDataSource>(),
          instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<DriverChangePasswordUseCase>()) {
    instance.registerLazySingleton<DriverChangePasswordUseCase>(() =>
        DriverChangePasswordUseCase(
            instance<DriverChangePasswordRepository>()));
  }
}

initPoliceManChangePassword() {
  if (!GetIt.I.isRegistered<RemotePoliceManChangePasswordDataSource>()) {
    instance.registerLazySingleton<RemotePoliceManChangePasswordDataSource>(
        () => RemotePoliceManChangePasswordDataSourceImpl(
              instance<AppApi>(),
            ));
  }
  if (!GetIt.I.isRegistered<PoliceManChangePasswordRepository>()) {
    instance.registerLazySingleton<PoliceManChangePasswordRepository>(
      () => PoliceManChangePasswordRepositoryImpl(
          instance<RemotePoliceManChangePasswordDataSource>(),
          instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<PoliceManChangePasswordUseCase>()) {
    instance.registerLazySingleton<PoliceManChangePasswordUseCase>(() =>
        PoliceManChangePasswordUseCase(
            instance<PoliceManChangePasswordRepository>()));
  }
}

initPayment() {
  if (!GetIt.I.isRegistered<RemotePaymentViolationDataSource>()) {
    instance.registerLazySingleton<RemotePaymentViolationDataSource>(
        () => RemotePaymentViolationDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<PaymentViolationRepository>()) {
    instance.registerLazySingleton<PaymentViolationRepository>(
      () => PaymentViolationRepositoryImpl(
          instance<RemotePaymentViolationDataSource>(),
          instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<PaymentViolationUseCase>()) {
    instance.registerLazySingleton<PaymentViolationUseCase>(
        () => PaymentViolationUseCase(instance<PaymentViolationRepository>()));
  }
  Get.put<PaymentController>(PaymentController());
}

disposePayment() {
  if (GetIt.I.isRegistered<RemotePaymentViolationDataSource>()) {
    instance.unregister<RemotePaymentViolationDataSource>();
  }
  if (GetIt.I.isRegistered<PaymentViolationRepository>()) {
    instance.unregister<PaymentViolationRepository>();
  }
  if (GetIt.I.isRegistered<PaymentViolationUseCase>()) {
    instance.unregister<PaymentViolationUseCase>();
  }
  Get.delete<PaymentController>();
}

initViolationPayment() {
  if (!GetIt.I.isRegistered<RemoteDriverViolationsDataSource>()) {
    instance.registerLazySingleton<RemoteDriverViolationsDataSource>(
        () => RemoteDriverViolationsDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<DriverViolationsRepository>()) {
    instance.registerLazySingleton<DriverViolationsRepository>(
      () => DriverViolationsRepositoryImpl(
          instance<RemoteDriverViolationsDataSource>(),
          instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<DriverViolationsUseCase>()) {
    instance.registerLazySingleton<DriverViolationsUseCase>(
        () => DriverViolationsUseCase(instance<DriverViolationsRepository>()));
  }
  Get.put<DriverViolationsController>(DriverViolationsController());
}

disposeViolationPayment() {
  if (GetIt.I.isRegistered<RemoteDriverViolationsDataSource>()) {
    instance.unregister<RemoteDriverViolationsDataSource>();
  }
  if (GetIt.I.isRegistered<DriverViolationsRepository>()) {
    instance.unregister<DriverViolationsRepository>();
  }
  if (GetIt.I.isRegistered<DriverViolationsUseCase>()) {
    instance.unregister<DriverViolationsUseCase>();
  }
  Get.delete<DriverViolationsController>();
}

initChangePassword() {
  disposeVerificationCode();
  disposeForgotPasswordForDriver();
  disposeForgotPasswordForPoliceMan();
  Get.put<ChangePasswordController>(ChangePasswordController());
}

disposeChangePassword() {
  if (GetIt.I.isRegistered<RemoteDriverChangePasswordDataSource>()) {
    instance.unregister<RemoteDriverChangePasswordDataSource>();
  }
  if (GetIt.I.isRegistered<DriverChangePasswordRepository>()) {
    instance.unregister<DriverChangePasswordRepository>();
  }
  if (GetIt.I.isRegistered<DriverChangePasswordUseCase>()) {
    instance.unregister<DriverChangePasswordUseCase>();
  }
  if (GetIt.I.isRegistered<RemotePoliceManChangePasswordDataSource>()) {
    instance.unregister<RemotePoliceManChangePasswordDataSource>();
  }
  if (GetIt.I.isRegistered<PoliceManChangePasswordRepository>()) {
    instance.unregister<PoliceManChangePasswordRepository>();
  }
  if (GetIt.I.isRegistered<PoliceManChangePasswordUseCase>()) {
    instance.unregister<PoliceManChangePasswordUseCase>();
  }
  Get.delete<ChangePasswordController>();
}

initDriverProfile() {
  Get.put<DriverProfileController>(DriverProfileController());
}

disposeDriverProfile() {
  Get.delete<DriverProfileController>();
}

initNotification() {
  disposeDriverHome();
  Get.put<NotificationsController>(NotificationsController());
}

disposeNotification() {
  Get.delete<NotificationsController>();
}
