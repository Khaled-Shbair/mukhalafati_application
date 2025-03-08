import '/config/all_imports.dart';

class DriverProfileController extends GetxController with CustomToast {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _useCase = instance<SendRequestUpdateProfileUseCase>();
  final _sharedPrefController = instance<SharedPreferencesController>();

  late String driverImage;

  late TextEditingController driverName;
  late TextEditingController driverPhone;
  late TextEditingController driverId;
  late TextEditingController licenceNumber;

  @override
  void onInit() {
    super.onInit();
    driverImage = _sharedPrefController.getString(SharedPreferencesKeys.image);
    driverName = TextEditingController(
        text: _sharedPrefController.getString(SharedPreferencesKeys.nameAr));
    driverPhone = TextEditingController(
        text:
            _sharedPrefController.getString(SharedPreferencesKeys.phoneNumber))

      ..addListener(
            () {
          selectCursorPosition(driverPhone);
        },
      );
    driverId = TextEditingController(
        text: _sharedPrefController.getString(SharedPreferencesKeys.idNumber)) ..addListener(
          () {
        selectCursorPosition(driverId);
      },
    );
    licenceNumber = TextEditingController(
        text: _sharedPrefController
            .getString(SharedPreferencesKeys.licenseOrJobNumber))
      ..addListener(
            () {
          selectCursorPosition(licenceNumber);
        },
      );
  }

  @override
  void onClose() {
    driverName.dispose();
    driverPhone.dispose();
    driverId.dispose();
    licenceNumber.dispose();
    super.onClose();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// Driver send request to update profile data when see error in data
  void updateDataButton(BuildContext context) async {
    if (_checkDataDriver()) {
      (await _useCase.execute(
        SendRequestUpdateProfileInput(
            phoneNumber: driverPhone.text,
            idNumber: driverId.text,
            driverId:
                _sharedPrefController.getInt(SharedPreferencesKeys.userId),
            name: driverName.text,
            licenseNumber: licenceNumber.text),
      ))
          .fold(
        /// Failed request update profile
        (l) {
          /// Appear message of error in SnackBar to user
          showToast(message: l.message, context: context);
        },

        /// Successfully request update profile

        (r) {
          customCreatedSuccessfullyDialog(
            closeButton: () {
              /// Remove driver profile controller form memory
              disposeDriverProfile();

              /// Navigate to driver home screen
              Get.offAllNamed(Routes.driverHomeScreen);
            },
            context: Get.context!,
            text: ManagerStrings.yourUpdateRequestHasBeenSubmittedSuccessfully,
            startPaddingText: ManagerWidth.w28,
            endPaddingText: ManagerWidth.w28,
          );
        },
      );
    } else {
      /// Appear message of error in SnackBar to user
      showToast(
          message: ManagerStrings.pleaseEnterDataThisNeedUpdated,
          context: context);
    }
  }

  /// check inputs user data in not empty and not similar previous data
  bool _checkDataDriver() {
    if (driverName.text.isNotEmpty &&
            driverPhone.text.isNotEmpty &&
            driverId.text.isNotEmpty &&
            licenceNumber.text.isNotEmpty &&
            driverName.text !=
                _sharedPrefController.getString(SharedPreferencesKeys.nameAr) ||
        driverPhone.text !=
            _sharedPrefController
                .getString(SharedPreferencesKeys.phoneNumber) ||
        driverId.text !=
            _sharedPrefController.getString(SharedPreferencesKeys.idNumber) ||
        licenceNumber.text !=
            _sharedPrefController
                .getString(SharedPreferencesKeys.licenseOrJobNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
