import '/config/all_imports.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin, Helpers {
  final PoliceManLoginUseCase _policeManLoginUseCase =
      instance<PoliceManLoginUseCase>();
  final DriverLoginUseCase _driverLoginUseCase = instance<DriverLoginUseCase>();
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
    tabController = TabController(length: 2, vsync: this);
    jobNumber = TextEditingController();
    passwordPoliceMan = TextEditingController();
    licenseNumber = TextEditingController();
    passwordDriver = TextEditingController();
    forgetPoliceManPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(Routes.forgetPoliceManPasswordScreen);
    forgetDriverPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () => Get.toNamed(Routes.forgetDriverPasswordScreen);
  }

  @override
  void dispose() {
    jobNumber.dispose();
    passwordPoliceMan.dispose();
    licenseNumber.dispose();
    passwordDriver.dispose();
    forgetPoliceManPasswordRecognizer.dispose();
    forgetDriverPasswordRecognizer.dispose();
    super.dispose();
  }

  void backButton() {
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

  void loginDriver() async {
    if (_checkDataDriver()) {
      (await _driverLoginUseCase.execute(
        DriverLoginInput(
          licenseNumber: licenseNumber.text,
          password: passwordDriver.text,
        ),
      ))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
        (r) async {
          await SharedPreferencesController.setData(
              SharedPreferencesKeys.rememberMeDriver, false);
          await AppSettingsSharedPreferences.setDriverData(r);
          await Get.offAllNamed(Routes.driverHomeScreen);
        },
      );
    } else {
      showSnackBar(
          message: ManagerStrings.pleaseEnterYourLicenseNumberAndPassword);
    }
  }

  void loginPoliceMan() async {
    if (_checkDataPolice()) {
      (await _policeManLoginUseCase.execute(PoliceManLoginInput(
              jobNumber: jobNumber.text, password: passwordPoliceMan.text)))
          .fold(
        (l) {
          showSnackBar(message: l.message);
        },
        (r) async {
          await AppSettingsSharedPreferences.setPoliceData(r);
          SharedPreferencesController.setData(
              SharedPreferencesKeys.rememberMePolice, true);
          Get.offAllNamed(Routes.policeManHomeScreen);
        },
      );
    } else {
      showSnackBar(message: ManagerStrings.pleaseEnterYourJobNumberAndPassword);
    }
  }

  bool _checkDataDriver() {
    if (licenseNumber.text.isNotEmpty && passwordDriver.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool _checkDataPolice() {
    if (jobNumber.text.isNotEmpty && passwordPoliceMan.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
