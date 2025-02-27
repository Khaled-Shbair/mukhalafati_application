import '/config/all_imports.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin, CustomToast {
  final _sharedPrefController = instance<SharedPreferencesController>();
  final _driverFormKey = GlobalKey<FormState>();
  final _policeFormKey = GlobalKey<FormState>();
  late TabController _tabController;
  late TextEditingController _jobNumber;
  late TextEditingController _passwordPoliceMan;
  late TextEditingController _licenseNumber;
  late TextEditingController _passwordDriver;
  late GestureRecognizer _forgetPoliceManPasswordRecognizer;
  late GestureRecognizer _forgetDriverPasswordRecognizer;
  bool _rememberMePoliceMan = false;
  bool _rememberMeDriver = false;
  bool _obscurePasswordPoliceMan = true;
  bool _obscurePasswordDriver = true;

  GlobalKey<FormState> get driverFormKey => _driverFormKey;

  GlobalKey<FormState> get policeFormKey => _policeFormKey;

  TabController get tabController => _tabController;

  TextEditingController get jobNumber => _jobNumber;

  TextEditingController get passwordPoliceMan => _passwordPoliceMan;

  TextEditingController get licenseNumber => _licenseNumber;

  TextEditingController get passwordDriver => _passwordDriver;

  GestureRecognizer get forgetPoliceManPasswordRecognizer =>
      _forgetPoliceManPasswordRecognizer;

  GestureRecognizer get forgetDriverPasswordRecognizer =>
      _forgetDriverPasswordRecognizer;

  bool get rememberMePoliceMan => _rememberMePoliceMan;

  bool get rememberMeDriver => _rememberMeDriver;

  bool get obscurePasswordPoliceMan => _obscurePasswordPoliceMan;

  bool get obscurePasswordDriver => _obscurePasswordDriver;

  @override
  void onInit() {
    super.onInit();
    _tabController = TabController(
      length: AppConstants.lengthOfTabBarInLoginController,
      vsync: this,
    );
    _jobNumber = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_jobNumber);
        },
      );
    _passwordPoliceMan = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_passwordPoliceMan);
        },
      );
    _licenseNumber = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_licenseNumber);
        },
      );
    _passwordDriver = TextEditingController()
      ..addListener(
        () {
          selectCursorPosition(_passwordDriver);
        },
      );
    _forgetPoliceManPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        await initForgotPasswordForPoliceMan();
        Get.toNamed(Routes.forgetPoliceManPasswordScreen, arguments: false);
      };
    _forgetDriverPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        await initForgotPasswordForDriver();
        Get.toNamed(Routes.forgetPasswordScreen, arguments: true);
      };
  }

  @override
  void onClose() {
    _jobNumber.dispose();
    _passwordPoliceMan.dispose();
    _licenseNumber.dispose();
    _passwordDriver.dispose();
    _forgetPoliceManPasswordRecognizer.dispose();
    _forgetDriverPasswordRecognizer.dispose();
    super.onClose();
  }

  /// To back to welcome screen and remove login controller from memory
  void backButton() {
    disposeLogin();
    Get.offAllNamed(Routes.welcomeScreen);
  }

  void changeRememberMePoliceMan(bool isRememberMe) {
    _rememberMePoliceMan = isRememberMe;
    update();
  }

  void changeRememberMeDriver(bool isRememberMe) {
    _rememberMeDriver = isRememberMe;
    update();
  }

  void changeObscurePasswordPoliceMan() {
    _obscurePasswordPoliceMan = !_obscurePasswordPoliceMan;
    update();
  }

  void changeObscurePasswordDriver() {
    _obscurePasswordDriver = !_obscurePasswordDriver;
    update();
  }

  void loginDriver(BuildContext context) async {
    if (_driverFormKey.currentState!.validate()) {
      customLoading(context);
      await initDriverLogin();
      final DriverLoginUseCase driverLoginUseCase =
          instance<DriverLoginUseCase>();
      (await driverLoginUseCase.execute(
        DriverLoginInput(
          licenseNumber: _licenseNumber.text,
          password: _passwordDriver.text,
        ),
      ))
          .fold(
        /// Failed request login
        (l) {
          /// Close loading dialog
          context.pop();

          /// Appear message of error in SnackBar to user
          showToast(message: l.message, context: context);
        },

        /// Successfully request login
        (r) async {
          /// Save account logged-in or not when close app
          await _sharedPrefController.setData(
              SharedPreferencesKeys.rememberMeDriver, _rememberMeDriver);

          /// Save data of driver when login
          await _saveDriverDataInSharedPref(r);

          if (context.mounted) {
            /// Close loading dialog && Navigate to driver home screen
            context.popAndPushNamed(Routes.driverHomeScreen);
            disposeLogin();
          }
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showToast(
          message: ManagerStrings.pleaseEnterYourLicenseNumberAndPassword,
          context: context);
    }
    update();
  }

  /// login police man account
  void loginPoliceMan(BuildContext context) async {
    if (_policeFormKey.currentState!.validate()) {
      customLoading(context);
      await initPoliceManLogin();
      final PoliceManLoginUseCase policeManLoginUseCase =
          instance<PoliceManLoginUseCase>();
      (await policeManLoginUseCase.execute(PoliceManLoginInput(
              jobNumber: _jobNumber.text, password: _passwordPoliceMan.text)))
          .fold(
        /// Failed login request
        (l) {
          context.pop();

          /// Appear message of error in SnackBar to user
          showToast(message: l.message, context: context);
        },

        /// Successfully login request
        (r) async {
          /// Save account logged-in or not when close app
          await _sharedPrefController.setData(
              SharedPreferencesKeys.rememberMePolice, _rememberMePoliceMan);

          /// Save data of police man when login
          await _savePoliceDataInSharedPref(r);

          if (context.mounted) {
            /// Close loading dialog && Navigate to police man home screen
            context.popAndPushNamed(Routes.policeManHomeScreen);
            disposeLogin();
          }
        },
      );
    } else {
      context.pop();

      /// Appear message of error in SnackBar to user
      showToast(
          message: ManagerStrings.pleaseEnterYourJobNumberAndPassword,
          context: context);
    }
    update();
  }

  Future<void> _savePoliceDataInSharedPref(PoliceManLoginModel police) async {
    await _sharedPrefController.setData(
        SharedPreferencesKeys.image, police.image);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.phoneNumber, police.phoneNumber);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.nameAr, police.nameAr);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.nameEn, police.nameEn);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.licenseOrJobNumber, police.jobNumber);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.policeMilitaryRank, police.militaryRank);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.userId, police.id);
  }

  Future<void> _saveDriverDataInSharedPref(DriverLoginModel driver) async {
    await _sharedPrefController.setData(
        SharedPreferencesKeys.numberOfUnReadNotifications,
        driver.numberOfUnReadNotifications);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.numberOfViolationsPaid,
        driver.numberOfViolationsPaid);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.numberOfViolationsUnPaid,
        driver.numberOfViolationsUnPaid);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.userId, driver.id);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.expiryDateLicense, driver.expiryDate);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.releaseDateLicense, driver.releaseDate);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.idNumber, driver.idNumber);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.licenseLevelsOfLicense, driver.licenseLevels);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.nameAr, driver.nameAr);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.nameEn, driver.nameEn);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.image, driver.image);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.phoneNumber, driver.phone);
    await _sharedPrefController.setData(
        SharedPreferencesKeys.licenseOrJobNumber, driver.licenseNumber);
  }
}
