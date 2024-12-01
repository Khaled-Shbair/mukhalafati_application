import 'package:mukhalafati_application/config/all_imports.dart';

class AppSettingsSharedPreferences {
  // private constructor as I don’t allow creating an instance of this class itself
  AppSettingsSharedPreferences._();

  // create only one instance from this class
  static final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      AppSettingsSharedPreferences._();

  // create factory constructor to return instance of this class
  factory AppSettingsSharedPreferences() => _appSettingsSharedPreferences;

  static Future<void> clear() async {
    SharedPreferencesController.removeData(SharedPreferencesKeys.image);
    SharedPreferencesController.removeData(SharedPreferencesKeys.userId);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.rememberMeDriver);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.rememberMePolice);
    SharedPreferencesController.removeData(SharedPreferencesKeys.firstName);
    SharedPreferencesController.removeData(SharedPreferencesKeys.lastName);
    SharedPreferencesController.removeData(SharedPreferencesKeys.fullNameAr);
    SharedPreferencesController.removeData(SharedPreferencesKeys.fullNameEn);
    SharedPreferencesController.removeData(SharedPreferencesKeys.phoneNumber);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.licenseOrJobNumber);

    SharedPreferencesController.removeData(
        SharedPreferencesKeys.expiryDateLicense);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.releaseDateLicense);
    SharedPreferencesController.removeData(SharedPreferencesKeys.idNumber);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.licenseLevelsOfLicense);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.numberOfViolationsUnPaid);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.numberOfViolationsPaid);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.numberOfUnReadNotifications);
    SharedPreferencesController.removeData(
        SharedPreferencesKeys.policeMilitaryRank);
  }

  static Future<void> setDriverData(DriverLoginModel driver) async {
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.numberOfUnReadNotifications,
        driver.numberOfUnReadNotifications.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.numberOfViolationsPaid,
        driver.numberOfViolationsPaid.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.numberOfViolationsUnPaid,
        driver.numberOfViolationsUnPaid.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.userId, driver.id.onNull());

    await SharedPreferencesController.setData(
        SharedPreferencesKeys.expiryDateLicense, driver.expiryDate.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.releaseDateLicense, driver.releaseDate.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.idNumber, driver.idNumber.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.licenseLevelsOfLicense,
        driver.licenseLevels.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.firstName, driver.firstNameAr.onNull());

    await SharedPreferencesController.setData(
        SharedPreferencesKeys.lastName, driver.lastNameAr.onNull());
    await SharedPreferencesController.setData(SharedPreferencesKeys.fullNameAr,
        '${driver.firstNameAr.onNull()} ${driver.fatherNameAr.onNull()} ${driver.grandFatherNameAr.onNull()} ${driver.lastNameAr.onNull()}');
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.image, driver.image.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.phoneNumber, driver.phone.onNull());

    await SharedPreferencesController.setData(
        SharedPreferencesKeys.licenseOrJobNumber,
        driver.licenseNumber.onNull());

    await SharedPreferencesController.setData(SharedPreferencesKeys.fullNameEn,
        '${driver.firstNameEn.onNull()} ${driver.fatherNameEn.onNull()} ${driver.grandFatherNameEn.onNull()} ${driver.lastNameEn.onNull()}');
  }

  static Future<void> setPoliceData(PoliceManLoginModel police) async {
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.image, police.image.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.phoneNumber, police.phoneNumber.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.firstName, police.firstNameAr.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.lastName, police.lastNameAr.onNull());

    await SharedPreferencesController.setData(
        SharedPreferencesKeys.licenseOrJobNumber, police.jobNumber.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.policeMilitaryRank, police.militaryRank.onNull());
    await SharedPreferencesController.setData(
        SharedPreferencesKeys.userId, police.id.onNull());
  }
}
