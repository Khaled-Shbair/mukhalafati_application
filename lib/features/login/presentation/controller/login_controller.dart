import '/config/all_imports.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin, Helpers {
  late TabController tabController;
  late TextEditingController jobNumber;
  late TextEditingController passwordPoliceMan;
  late TextEditingController licenseNumber;
  late TextEditingController passwordDriver;
  late GestureRecognizer forgetPoliceManPasswordRecognizer;
  late GestureRecognizer forgetDriverPasswordRecognizer;
  bool rememberMePoliceMan = false;
  bool rememberMeDriver = false;
  bool obscurePasswordPoliceMan = false;
  bool obscurePasswordDriver = false;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: AppConstants.lengthOfTabBarInLoginController,
      vsync: this,
    );
    jobNumber = TextEditingController();
    passwordPoliceMan = TextEditingController();
    licenseNumber = TextEditingController();
    passwordDriver = TextEditingController();
    forgetPoliceManPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        await initForgotPasswordForPoliceMan();
        Get.toNamed(Routes.forgetPoliceManPasswordScreen, arguments: false);
      };
    forgetDriverPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        await initForgotPasswordForDriver();
        Get.toNamed(Routes.forgetPasswordScreen, arguments: true);
      };
  }

  @override
  void onClose() {
    jobNumber.dispose();
    passwordPoliceMan.dispose();
    licenseNumber.dispose();
    passwordDriver.dispose();
    forgetPoliceManPasswordRecognizer.dispose();
    forgetDriverPasswordRecognizer.dispose();
    super.onClose();
  }

  /// To back to welcome screen and remove login controller from memory
  void backButton() {
    disposeLogin();
    Get.offAllNamed(Routes.welcomeScreen);
  }

  void changeRememberMePoliceMan(bool isRememberMe) {
    rememberMePoliceMan = isRememberMe;
    update();
  }

  void changeRememberMeDriver(bool isRememberMe) {
    rememberMeDriver = isRememberMe;
    update();
  }

  void changeObscurePasswordPoliceMan() {
    obscurePasswordPoliceMan = !obscurePasswordPoliceMan;
    update();
  }

  void changeObscurePasswordDriver() {
    obscurePasswordDriver = !obscurePasswordDriver;
    update();
  }

  void loginDriver(BuildContext context) async {
    if (_checkDataDriver()) {
      await initDriverLogin();
      final DriverLoginUseCase driverLoginUseCase =
          instance<DriverLoginUseCase>();
      (await driverLoginUseCase.execute(
        DriverLoginInput(
          licenseNumber: licenseNumber.text,
          password: passwordDriver.text,
        ),
      ))
          .fold(
        /// Failed request login
        (l) {
          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: context);
        },

        /// Successfully request login
        (r) async {
          /// Save account logged-in or not when close app
          await SharedPreferencesController.setData(
              SharedPreferencesKeys.rememberMeDriver, rememberMeDriver);

          /// Save data of driver when login
          await saveDriverData(r);

          /// Navigate to driver home screen
          await Get.offAllNamed(Routes.driverHomeScreen);
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showSnackBar(
          message: ManagerStrings.pleaseEnterYourLicenseNumberAndPassword,
          context: context);
    }
  }

  /// login police man account
  void loginPoliceMan(BuildContext context) async {
    if (_checkDataPolice()) {
      await initPoliceManLogin();
      final PoliceManLoginUseCase policeManLoginUseCase =
          instance<PoliceManLoginUseCase>();
      (await policeManLoginUseCase.execute(PoliceManLoginInput(
              jobNumber: jobNumber.text, password: passwordPoliceMan.text)))
          .fold(
        /// Failed login request
        (l) {
          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: context);
        },

        /// Successfully login request
        (r) async {
          /// Save account logged-in or not when close app
          SharedPreferencesController.setData(
              SharedPreferencesKeys.rememberMePolice, rememberMePoliceMan);

          /// Save data of police man when login
          await savePoliceData(r);

          /// Navigate to police man home screen
          Get.offAllNamed(Routes.policeManHomeScreen);
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showSnackBar(
          message: ManagerStrings.pleaseEnterYourJobNumberAndPassword,
          context: context);
    }
  }

  /// check inputs user data in not empty
  bool _checkDataDriver() {
    if (licenseNumber.text.isNotEmpty && passwordDriver.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  /// check inputs user data in not empty
  bool _checkDataPolice() {
    if (jobNumber.text.isNotEmpty && passwordPoliceMan.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
