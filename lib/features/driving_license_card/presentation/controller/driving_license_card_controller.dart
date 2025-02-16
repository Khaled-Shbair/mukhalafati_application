import '/config/all_imports.dart';

class DrivingLicenseCardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _sharedPrefController = instance<SharedPreferencesController>();
  late String licenseNumber;
  late String expiryDate;

  late String releaseDate;

  late String idNumber;

  late String nameAr;

  late String nameEn;

  late String licenseLevels;

  late String imageDriver;

  bool openFrontElectronicLicenseCard = false;
  bool openBackElectronicLicenseCard = false;
  bool openFullElectronicLicenseCard = false;

  @override
  void onInit() {
    super.onInit();
    licenseNumber = _sharedPrefController
        .getString(SharedPreferencesKeys.licenseOrJobNumber);
    expiryDate = _sharedPrefController
        .getString(SharedPreferencesKeys.expiryDateLicense);

    releaseDate = _sharedPrefController
        .getString(SharedPreferencesKeys.releaseDateLicense);

    idNumber = _sharedPrefController.getString(SharedPreferencesKeys.idNumber);
    nameAr = _sharedPrefController.getString(SharedPreferencesKeys.nameAr);
    nameEn = _sharedPrefController.getString(SharedPreferencesKeys.nameEn);

    licenseLevels = _sharedPrefController
        .getString(SharedPreferencesKeys.licenseLevelsOfLicense);
    imageDriver = _sharedPrefController.getString(SharedPreferencesKeys.image);
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// change value of [openFrontElectronicLicenseCard] when open front face
  /// of license card
  void changeOpenFrontElectronicLicenseCard(bool value) {
    openFrontElectronicLicenseCard = value;
    update();
  }

  /// change value of [openBackElectronicLicenseCard] when open back face
  /// of license card
  void changeOpenBackElectronicLicenseCard(bool value) {
    openBackElectronicLicenseCard = value;
    update();
  }

  /// change value of [openFullElectronicLicenseCard] when open two faces
  /// of license card
  void changeOpenFullElectronicLicenseCard(bool value) {
    openFullElectronicLicenseCard = value;
    update();
  }

  /// Hide [image] when open full electronic license card
  bool appearImageDrivingLicenseCard() {
    return openFullElectronicLicenseCard == false;
  }

  /// Hide [title] and [subTitle] when open any face of license card
  bool appearText() {
    return openFullElectronicLicenseCard == false &&
        openFrontElectronicLicenseCard == false &&
        openBackElectronicLicenseCard == false;
  }
}
