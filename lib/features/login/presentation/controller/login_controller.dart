import '/config/all_imports.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
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

  void loginDriver() {
    Get.offAllNamed(Routes.driverHomeScreen);
  }

  void loginPoliceMan() {
    Get.offAllNamed(Routes.policeManHomeScreen);
  }
}
