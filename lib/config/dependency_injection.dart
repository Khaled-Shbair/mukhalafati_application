import 'package:dio/dio.dart';

import 'all_imports.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initDio();
  await _initSharedPreferences();
  await _initFirebase();
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(InternetConnection()));
}

Future<void> _initSharedPreferences() async {
  if (!GetIt.I.isRegistered<SharedPreferences>()) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    instance.registerLazySingleton(() => sharedPreferences);
  }
  if (!GetIt.I.isRegistered<SharedPreferencesController>()) {
    instance.registerLazySingleton(
        () => SharedPreferencesController(instance<SharedPreferences>()));
  }
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!GetIt.I.isRegistered<FbNotifications>()) {
    instance.registerLazySingleton<FbNotifications>(() => FbNotifications());
  }
  if (!GetIt.I.isRegistered<FirebaseMessaging>()) {
    instance.registerLazySingleton<FirebaseMessaging>(
        () => FirebaseMessaging.instance);
  }
  await instance<FbNotifications>().initNotifications();
  await instance<FbNotifications>().requestNotificationPermissions();
  instance<FbNotifications>().initializeForegroundNotificationForAndroid();
  instance<FbNotifications>().manageNotificationAction();
}

Future<void> _initDio() async {
  if (!GetIt.I.isRegistered<DioFactory>()) {
    instance.registerLazySingleton<DioFactory>(() => DioFactory());
  }
  if (!GetIt.I.isRegistered<AppApi>()) {
    Dio dio = await instance<DioFactory>().getDio();
    instance.registerLazySingleton<AppApi>(() => AppApi(dio));
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [OnBoarding]
initOnBoarding() {
  Get.put<OnBoardingController>(OnBoardingController());
}

disposeOnBoarding() {
  Get.delete<OnBoardingController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Welcome_controller], [Login_driver] and [login_police_man]
initWelcome() {
  Get.put<WelcomeController>(WelcomeController());
}

initLogin() {
  Get.put<LoginController>(LoginController());
}

Future<void> initDriverLogin() async {
  if (!GetIt.I.isRegistered<RemoteDriverLoginDataSource>()) {
    instance.registerLazySingleton<RemoteDriverLoginDataSource>(() =>
        RemoteLoginDataSourceImpl(
            instance<AppApi>(), instance<SharedPreferencesController>()));
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
}

Future<void> initPoliceManLogin() async {
  if (!GetIt.I.isRegistered<RemotePoliceManLoginDataSource>()) {
    instance.registerLazySingleton<RemotePoliceManLoginDataSource>(
        () => RemotePoliceManLoginDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
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

disposeWelcome() {
  Get.delete<WelcomeController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Forgot_password] and [Verification_code]
initForgotPassword() {
  Get.put<ForgotPasswordController>(ForgotPasswordController());
}

initForgotPasswordForDriver() {
  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
  if (!GetIt.I.isRegistered<FBAuthentication>()) {
    instance.registerLazySingleton<FBAuthentication>(
        () => FBAuthentication(instance<FirebaseAuth>()));
  }

  if (!GetIt.I.isRegistered<RemoteDriverForgotPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteDriverForgotPasswordDataSource>(
        () => RemoteDriverForgotPasswordDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
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
}

initForgotPasswordForPoliceMan() {
  if (!GetIt.I.isRegistered<FirebaseAuth>()) {
    instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
  if (!GetIt.I.isRegistered<FBAuthentication>()) {
    instance.registerLazySingleton<FBAuthentication>(
        () => FBAuthentication(instance<FirebaseAuth>()));
  }

  if (!GetIt.I.isRegistered<RemotePoliceManForgotPasswordDataSource>()) {
    instance.registerLazySingleton<RemotePoliceManForgotPasswordDataSource>(
        () => RemotePoliceManForgotPasswordDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
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
}

disposeForgotPassword() {
  if (GetIt.I.isRegistered<FBAuthentication>()) {
    instance.unregister<FBAuthentication>();
  }
  if (GetIt.I.isRegistered<FirebaseAuth>()) {
    instance.unregister<FirebaseAuth>();
  }

  if (GetIt.I.isRegistered<RemoteDriverForgotPasswordDataSource>()) {
    instance.unregister<RemoteDriverForgotPasswordDataSource>();
  }
  if (GetIt.I.isRegistered<DriverForgotPasswordRepository>()) {
    instance.unregister<DriverForgotPasswordRepository>();
  }
  if (GetIt.I.isRegistered<DriverForgotPasswordUseCase>()) {
    instance.unregister<DriverForgotPasswordUseCase>();
  }
  if (GetIt.I.isRegistered<RemotePoliceManForgotPasswordDataSource>()) {
    instance.unregister<RemotePoliceManForgotPasswordDataSource>();
  }
  if (GetIt.I.isRegistered<PoliceManForgotPasswordRepository>()) {
    instance.unregister<PoliceManForgotPasswordRepository>();
  }
  if (GetIt.I.isRegistered<PoliceManForgotPasswordUseCase>()) {
    instance.unregister<PoliceManForgotPasswordUseCase>();
  }
  Get.delete<ForgotPasswordController>();
}

initVerificationCode() {
  Get.put<VerificationCodeController>(VerificationCodeController());
}

disposeVerificationCode() {
  Get.delete<VerificationCodeController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Change_Password]
initChangePassword() {
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

initDriverChangePassword() {
  if (!GetIt.I.isRegistered<RemoteDriverChangePasswordDataSource>()) {
    instance.registerLazySingleton<RemoteDriverChangePasswordDataSource>(
        () => RemoteDriverChangePasswordDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
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
              instance<SharedPreferencesController>(),
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Logout]
initLogout() {
  Get.put<LogoutController>(LogoutController());
}

disposeLogout() {
  Get.delete<LogoutController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Driver_home] and [Police_man_home]
initPoliceManHome() {
  if (!GetIt.I.isRegistered<RemoteHomePoliceManDataSource>()) {
    instance.registerLazySingleton<RemoteHomePoliceManDataSource>(
        () => RemoteHomePoliceManDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
  }
  if (!GetIt.I.isRegistered<HomePoliceManRepo>()) {
    instance.registerLazySingleton<HomePoliceManRepo>(
      () => HomePoliceManRepoImpl(
          instance<RemoteHomePoliceManDataSource>(), instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<HomePoliceManUseCase>()) {
    instance.registerLazySingleton<HomePoliceManUseCase>(
        () => HomePoliceManUseCase(instance<HomePoliceManRepo>()));
  }
  Get.put<PoliceManHomeController>(PoliceManHomeController());
}

disposePoliceManHome() {
  if (GetIt.I.isRegistered<RemoteHomePoliceManDataSource>()) {
    instance.unregister<RemoteHomePoliceManDataSource>();
  }
  if (GetIt.I.isRegistered<HomePoliceManRepo>()) {
    instance.unregister<HomePoliceManRepo>();
  }
  if (GetIt.I.isRegistered<HomePoliceManUseCase>()) {
    instance.unregister<HomePoliceManUseCase>();
  }
  Get.delete<PoliceManHomeController>();
}

initDriverHome() {
  if (!GetIt.I.isRegistered<RemoteHomeDriverDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDriverDataSource>(
        () => RemoteHomeDriverDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
  }
  if (!GetIt.I.isRegistered<HomeDriverRepo>()) {
    instance.registerLazySingleton<HomeDriverRepo>(
      () => HomeDriverRepoImpl(
          instance<RemoteHomeDriverDataSource>(), instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<UpdateFcmTokenUseCase>()) {
    instance.registerLazySingleton<UpdateFcmTokenUseCase>(
        () => UpdateFcmTokenUseCase(instance<HomeDriverRepo>()));
  }
  Get.put<DriverHomeController>(DriverHomeController());
}

disposeDriverHome() {
  if (GetIt.I.isRegistered<RemoteHomeDriverDataSource>()) {
    instance.unregister<RemoteHomeDriverDataSource>();
  }
  if (GetIt.I.isRegistered<HomeDriverRepo>()) {
    instance.unregister<HomeDriverRepo>();
  }
  if (GetIt.I.isRegistered<UpdateFcmTokenUseCase>()) {
    instance.unregister<UpdateFcmTokenUseCase>();
  }
  Get.delete<DriverHomeController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

initCreateViolation() {
  initReasonsOfViolation();
  if (!GetIt.I.isRegistered<RemoteViolationDataSource>()) {
    instance.registerLazySingleton<RemoteViolationDataSource>(
        () => RemoteViolationDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
  }
  if (!GetIt.I.isRegistered<ViolationRepository>()) {
    instance.registerLazySingleton<ViolationRepository>(
        () => ViolationRepositoryImpl(
              instance<RemoteViolationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<CreateViolationUseCase>()) {
    instance.registerLazySingleton<CreateViolationUseCase>(
        () => CreateViolationUseCase(instance<ViolationRepository>()));
  }
  if (!GetIt.I.isRegistered<RemoteSaveNotificationDataSource>()) {
    instance.registerLazySingleton<RemoteSaveNotificationDataSource>(
        () => RemoteSaveNotificationDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<SaveNotificationRepository>()) {
    instance.registerLazySingleton<SaveNotificationRepository>(
        () => SaveNotificationRepositoryImpl(
              instance<RemoteSaveNotificationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<SaveNotificationUseCase>()) {
    instance.registerLazySingleton<SaveNotificationUseCase>(
        () => SaveNotificationUseCase(instance<SaveNotificationRepository>()));
  }
  Get.put<CreateViolationController>(CreateViolationController());
}

disposeCreateViolation() {
  if (GetIt.I.isRegistered<RemoteViolationDataSource>()) {
    instance.unregister<RemoteViolationDataSource>();
  }
  if (GetIt.I.isRegistered<ViolationRepository>()) {
    instance.unregister<ViolationRepository>();
  }
  if (GetIt.I.isRegistered<CreateViolationUseCase>()) {
    instance.unregister<CreateViolationUseCase>();
  }
  disposeReasonsOfViolation();
  Get.delete<CreateViolationController>();
}

disposeReasonsOfViolation() {
  if (GetIt.I.isRegistered<RemoteViolationDataSource>()) {
    instance.unregister<RemoteViolationDataSource>();
  }
  if (GetIt.I.isRegistered<ViolationRepository>()) {
    instance.unregister<ViolationRepository>();
  }
  if (GetIt.I.isRegistered<AllReasonOfViolationUseCase>()) {
    instance.unregister<AllReasonOfViolationUseCase>();
  }
}

initReasonsOfViolation() {
  if (!GetIt.I.isRegistered<RemoteViolationDataSource>()) {
    instance.registerLazySingleton<RemoteViolationDataSource>(
        () => RemoteViolationDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
  }
  if (!GetIt.I.isRegistered<ViolationRepository>()) {
    instance.registerLazySingleton<ViolationRepository>(
        () => ViolationRepositoryImpl(
              instance<RemoteViolationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<AllReasonOfViolationUseCase>()) {
    instance.registerLazySingleton<AllReasonOfViolationUseCase>(
        () => AllReasonOfViolationUseCase(instance<ViolationRepository>()));
  }
}

initListOfViolations() {
  if (!GetIt.I.isRegistered<RemoteViolationDataSource>()) {
    instance.registerLazySingleton<RemoteViolationDataSource>(
        () => RemoteViolationDataSourceImpl(
              instance<AppApi>(),
              instance<SharedPreferencesController>(),
            ));
  }
  if (!GetIt.I.isRegistered<ViolationRepository>()) {
    instance.registerLazySingleton<ViolationRepository>(
        () => ViolationRepositoryImpl(
              instance<RemoteViolationDataSource>(),
              instance<NetworkInfo>(),
            ));
  }
  if (!GetIt.I.isRegistered<AllViolationUseCase>()) {
    instance.registerLazySingleton<AllViolationUseCase>(
        () => AllViolationUseCase(instance<ViolationRepository>()));
  }
  if (!GetIt.I.isRegistered<GetViolationDetailsUseCase>()) {
    instance.registerLazySingleton<GetViolationDetailsUseCase>(
        () => GetViolationDetailsUseCase(instance<ViolationRepository>()));
  }
  Get.put<ListOfViolationsController>(ListOfViolationsController());
}

disposeListOfViolations() {
  Get.delete<ListOfViolationsController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Search_for_driver] and [Search_on_results_tests_of_license]
initSearchForDriver() {
  if (!GetIt.I.isRegistered<RemoteSearchForDriverDataSource>()) {
    instance.registerLazySingleton<RemoteSearchForDriverDataSource>(() =>
        RemoteSearchForDriverDataSourceImpl(
            instance<AppApi>(), instance<SharedPreferencesController>()));
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
  if (!GetIt.I.isRegistered<SearchOnResultsTestsOfLicenseUseCase>()) {
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Electric_driving_license_card]
initDrivingLicenseCard() {
  Get.put<DrivingLicenseCardController>(DrivingLicenseCardController());
}

disposeDrivingLicenseCard() {
  Get.delete<DrivingLicenseCardController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Complaints]
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Driver_payment]
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

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Driver_profile]
initDriverProfile() {
  if (!GetIt.I.isRegistered<RemoteSendRequestUpdateProfileDataSource>()) {
    instance.registerLazySingleton<RemoteSendRequestUpdateProfileDataSource>(
        () => RemoteSendRequestUpdateProfileDataSourceImpl(instance<AppApi>()));
  }
  if (!GetIt.I.isRegistered<SendRequestUpdateProfileRepository>()) {
    instance.registerLazySingleton<SendRequestUpdateProfileRepository>(
      () => SendRequestUpdateProfileRepositoryImpl(
          instance<RemoteSendRequestUpdateProfileDataSource>(),
          instance<NetworkInfo>()),
    );
  }
  if (!GetIt.I.isRegistered<SendRequestUpdateProfileUseCase>()) {
    instance.registerLazySingleton<SendRequestUpdateProfileUseCase>(() =>
        SendRequestUpdateProfileUseCase(
            instance<SendRequestUpdateProfileRepository>()));
  }
  Get.put<DriverProfileController>(DriverProfileController());
}

disposeDriverProfile() {
  if (GetIt.I.isRegistered<RemoteSendRequestUpdateProfileDataSource>()) {
    instance.unregister<RemoteSendRequestUpdateProfileDataSource>();
  }
  if (GetIt.I.isRegistered<SendRequestUpdateProfileRepository>()) {
    instance.unregister<SendRequestUpdateProfileRepository>();
  }
  if (GetIt.I.isRegistered<SendRequestUpdateProfileUseCase>()) {
    instance.unregister<SendRequestUpdateProfileUseCase>();
  }
  Get.delete<DriverProfileController>();
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
/// [Notification]
initNotification() {
  Get.put<NotificationsController>(NotificationsController());
}

disposeNotification() {
  Get.delete<NotificationsController>();
}
