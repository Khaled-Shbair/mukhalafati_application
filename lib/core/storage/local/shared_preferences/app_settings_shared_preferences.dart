import '/config/all_imports.dart';

enum PrefKeys {
  onBoarding,
  userId,
  rememberMeDriver,
  rememberMePolice,
  firstName,
  lastName,
  fullNameAr,
  fullNameEn,
  image,
  phoneNumber,
  licenseOrJobNumber,
  expiryDateLicense,
  releaseDateLicense,
  idNumber,
  licenseLevelsOfLicense,
  numberOfViolationsUnPaid,
  numberOfViolationsPaid,
  numberOfUnReadNotifications,
  policeMilitaryRank
}

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> clear() => _sharedPreferences.clear();

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

  Future<void> setRememberMeDriver(bool isRememberMe) async {
    await _sharedPreferences.setBool(
        PrefKeys.rememberMeDriver.toString(), isRememberMe);
  }

  Future<void> setRememberMePolice(bool isRememberMe) async {
    await _sharedPreferences.setBool(
        PrefKeys.rememberMePolice.toString(), isRememberMe);
  }

  Future<void> setDriverData(DriverModel driver) async {
    await _sharedPreferences.setInt(
        PrefKeys.numberOfUnReadNotifications.toString(),
        driver.numberOfUnReadNotifications);
    await _sharedPreferences.setInt(PrefKeys.numberOfViolationsPaid.toString(),
        driver.numberOfViolationsPaid);
    await _sharedPreferences.setInt(
        PrefKeys.numberOfViolationsUnPaid.toString(),
        driver.numberOfViolationsUnPaid);
    await _sharedPreferences.setInt(
        PrefKeys.userId.toString(), driver.driverId);
    await _sharedPreferences.setString(
        PrefKeys.expiryDateLicense.toString(), driver.expiryDate);
    await _sharedPreferences.setString(
        PrefKeys.releaseDateLicense.toString(), driver.releaseDate);
    await _sharedPreferences.setString(
        PrefKeys.idNumber.toString(), driver.driverIdNumber);
    await _sharedPreferences.setString(
        PrefKeys.licenseLevelsOfLicense.toString(), driver.licenseLevels);
    await _sharedPreferences.setString(
        PrefKeys.firstName.toString(), driver.driverFirstNameAr);
    await _sharedPreferences.setString(
        PrefKeys.lastName.toString(), driver.driverLastNameAr);
    await _sharedPreferences.setString(PrefKeys.fullNameAr.toString(),
        '${driver.driverFirstNameAr} ${driver.driverFatherNameAr} ${driver.driverGrandfatherNameAr} ${driver.driverLastNameAr}');
    await _sharedPreferences.setString(
        PrefKeys.fullNameEn.toString(), driver.driverNameEn);
    await _sharedPreferences.setString(
        PrefKeys.image.toString(), driver.driverImage);
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), driver.phone);
    await _sharedPreferences.setString(
        PrefKeys.licenseOrJobNumber.toString(), driver.licenseNumber);
  }

  Future<void> setPoliceData(PoliceModel police) async {
    await _sharedPreferences.setString(
        PrefKeys.image.toString(), police.policeImage);
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), police.policePhoneNumber);
    await _sharedPreferences.setString(
        PrefKeys.firstName.toString(), police.policeFirstNameAr);
    await _sharedPreferences.setString(
        PrefKeys.lastName.toString(), police.policeLastNameAr);
    await _sharedPreferences.setString(
        PrefKeys.licenseOrJobNumber.toString(), police.policeJobNumber);
    await _sharedPreferences.setString(
        PrefKeys.policeMilitaryRank.toString(), police.policeMilitaryRank);
    await _sharedPreferences.setInt(
        PrefKeys.userId.toString(), police.policeId);
  }

  bool getRememberMeDriver() =>
      _sharedPreferences.getBool(PrefKeys.rememberMeDriver.toString()).onNull();

  bool getRememberMePolice() =>
      _sharedPreferences.getBool(PrefKeys.rememberMePolice.toString()).onNull();

  String getFirstName() =>
      _sharedPreferences.getString(PrefKeys.firstName.toString()).onNull();

  String getLastName() =>
      _sharedPreferences.getString(PrefKeys.lastName.toString()).onNull();

  String getFullNameAr() =>
      _sharedPreferences.getString(PrefKeys.fullNameAr.toString()).onNull();

  String getFullNameEn() =>
      _sharedPreferences.getString(PrefKeys.fullNameEn.toString()).onNull();

  String getImage() =>
      _sharedPreferences.getString(PrefKeys.image.toString()).onNull();

  int getNumberOfViolationsPaid() => _sharedPreferences
      .getInt(PrefKeys.numberOfViolationsPaid.toString())
      .onNull();

  String getLicenseOrJobNumber() => _sharedPreferences
      .getString(PrefKeys.licenseOrJobNumber.toString())
      .onNull();

  String getIdNumber() =>
      _sharedPreferences.getString(PrefKeys.idNumber.toString()).onNull();

  String getPhoneNumber() =>
      _sharedPreferences.getString(PrefKeys.phoneNumber.toString()).onNull();

  bool getOnBoardingViewed() =>
      _sharedPreferences.getBool(PrefKeys.onBoarding.toString()).onNull();

  int getNumberOfUnReadNotifications() => _sharedPreferences
      .getInt(PrefKeys.numberOfUnReadNotifications.toString())
      .onNull();

  int getNumberOfViolationsUnPaid() => _sharedPreferences
      .getInt(PrefKeys.numberOfViolationsUnPaid.toString())
      .onNull();

  int getUserId() =>
      _sharedPreferences.getInt(PrefKeys.userId.toString()).onNull();

  String getExpiryDateLicense() => _sharedPreferences
      .getString(PrefKeys.expiryDateLicense.toString())
      .onNull();

  String getReleaseDateLicense() => _sharedPreferences
      .getString(PrefKeys.releaseDateLicense.toString())
      .onNull();

  String getLicenseLevelsOfLicense() => _sharedPreferences
      .getString(PrefKeys.licenseLevelsOfLicense.toString())
      .onNull();
}
