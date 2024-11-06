import '/config/all_imports.dart';

enum PrefKeys {
  onBoarding,
  language,
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

  Future<void> clear() async {
    _sharedPreferences.remove(PrefKeys.phoneNumber.toString());
    _sharedPreferences.remove(PrefKeys.image.toString());
    _sharedPreferences.remove(PrefKeys.fullNameEn.toString());
    _sharedPreferences.remove(PrefKeys.fullNameAr.toString());
    _sharedPreferences.remove(PrefKeys.lastName.toString());
    _sharedPreferences.remove(PrefKeys.firstName.toString());
    _sharedPreferences.remove(PrefKeys.rememberMeDriver.toString());
    _sharedPreferences.remove(PrefKeys.rememberMePolice.toString());
    _sharedPreferences.remove(PrefKeys.userId.toString());
    _sharedPreferences.remove(PrefKeys.policeMilitaryRank.toString());
    _sharedPreferences.remove(PrefKeys.numberOfUnReadNotifications.toString());
    _sharedPreferences.remove(PrefKeys.numberOfViolationsPaid.toString());
    _sharedPreferences.remove(PrefKeys.numberOfViolationsUnPaid.toString());
    _sharedPreferences.remove(PrefKeys.licenseLevelsOfLicense.toString());
    _sharedPreferences.remove(PrefKeys.idNumber.toString());
    _sharedPreferences.remove(PrefKeys.releaseDateLicense.toString());
    _sharedPreferences.remove(PrefKeys.expiryDateLicense.toString());
    _sharedPreferences.remove(PrefKeys.licenseOrJobNumber.toString());
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

  Future<void> setLanguage(String language) async {
    await _sharedPreferences.setString(PrefKeys.language.toString(), language);
  }

  Future<void> setRememberMeDriver(bool isRememberMe) async {
    await _sharedPreferences.setBool(
        PrefKeys.rememberMeDriver.toString(), isRememberMe);
  }

  Future<void> setRememberMePolice(bool isRememberMe) async {
    await _sharedPreferences.setBool(
        PrefKeys.rememberMePolice.toString(), isRememberMe);
  }

  Future<void> setDriverData(DriverLoginModel driver) async {
    await _sharedPreferences.setInt(
        PrefKeys.numberOfUnReadNotifications.toString(),
        driver.numberOfUnReadNotifications.onNull());
    await _sharedPreferences.setInt(
        PrefKeys.numberOfViolationsPaid.toString(),
        driver.numberOfViolationsPaid.onNull());
    await _sharedPreferences.setInt(
        PrefKeys.numberOfViolationsUnPaid.toString(),
        driver.numberOfViolationsUnPaid.onNull());
    await _sharedPreferences.setInt(
        PrefKeys.userId.toString(), driver.id.onNull());
    await _sharedPreferences.setString(
        PrefKeys.expiryDateLicense.toString(), driver.expiryDate.onNull());
    await _sharedPreferences.setString(
        PrefKeys.releaseDateLicense.toString(), driver.releaseDate.onNull());
    await _sharedPreferences.setString(
        PrefKeys.idNumber.toString(), driver.idNumber.onNull());
    await _sharedPreferences.setString(
        PrefKeys.licenseLevelsOfLicense.toString(),
        driver.licenseLevels.onNull());
    await _sharedPreferences.setString(
        PrefKeys.firstName.toString(), driver.firstNameAr.onNull());
    await _sharedPreferences.setString(
        PrefKeys.lastName.toString(), driver.lastNameAr.onNull());
    await _sharedPreferences.setString(PrefKeys.fullNameAr.toString(),
        '${driver.firstNameAr.onNull()} ${driver.fatherNameAr.onNull()} ${driver.grandFatherNameAr.onNull()} ${driver.lastNameAr.onNull()}');
    await _sharedPreferences.setString(PrefKeys.fullNameEn.toString(),
        '${driver.firstNameEn.onNull()} ${driver.fatherNameEn.onNull()} ${driver.grandFatherNameEn.onNull()} ${driver.lastNameEn.onNull()}');
    await _sharedPreferences.setString(
        PrefKeys.image.toString(), driver.image.onNull());
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), driver.phone.onNull());
    await _sharedPreferences.setString(
        PrefKeys.licenseOrJobNumber.toString(), driver.licenseNumber.onNull());
  }

  Future<void> setPoliceData(PoliceManLoginModel police) async {
    await _sharedPreferences.setString(
        PrefKeys.image.toString(), police.image.onNull());
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), police.phoneNumber.onNull());
    await _sharedPreferences.setString(
        PrefKeys.firstName.toString(), police.firstNameAr.onNull());
    await _sharedPreferences.setString(
        PrefKeys.lastName.toString(), police.lastNameAr.onNull());
    await _sharedPreferences.setString(
        PrefKeys.licenseOrJobNumber.toString(), police.jobNumber.onNull());
    await _sharedPreferences.setString(
        PrefKeys.policeMilitaryRank.toString(), police.militaryRank.onNull());
    await _sharedPreferences.setInt(
        PrefKeys.userId.toString(), police.id.onNull());
  }

  bool getRememberMeDriver() =>
      _sharedPreferences.getBool(PrefKeys.rememberMeDriver.toString()).onNull();

  String getLanguage() =>
      _sharedPreferences.getString(PrefKeys.language.toString()).onNull();

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
