import '/config/all_imports.dart';

class DriverProfileController extends GetxController with Helpers {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SendRequestUpdateProfileUseCase _useCase =
      instance<SendRequestUpdateProfileUseCase>();
  late String driverImage;

  late TextEditingController driverName;
  late TextEditingController driverPhone;
  late TextEditingController driverId;
  late TextEditingController licenceNumber;

  @override
  void onInit() {
    super.onInit();
    driverImage =
        SharedPreferencesController.getString(SharedPreferencesKeys.image);
    driverName = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.fullNameAr));
    driverPhone = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.phoneNumber));
    driverId = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.idNumber));
    licenceNumber = TextEditingController(
        text: SharedPreferencesController.getString(
            SharedPreferencesKeys.licenseOrJobNumber));
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
            driverId: SharedPreferencesController.getInt(
                SharedPreferencesKeys.userId),
            name: driverName.text,
            licenseNumber: licenceNumber.text),
      ))
          .fold(
        /// Failed request update profile
        (l) {
          /// Appear message of error in SnackBar to user
          showSnackBar(message: l.message, context: context);
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
      showSnackBar(
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
                SharedPreferencesController.getString(
                    SharedPreferencesKeys.fullNameAr) ||
        driverPhone.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.phoneNumber) ||
        driverId.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.idNumber) ||
        licenceNumber.text !=
            SharedPreferencesController.getString(
                SharedPreferencesKeys.licenseOrJobNumber)) {
      return true;
    } else {
      return false;
    }
  }
}
