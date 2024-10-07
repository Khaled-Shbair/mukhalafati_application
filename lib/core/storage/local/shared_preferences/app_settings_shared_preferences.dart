import '/config/all_imports.dart';

enum PrefKeys {
  onBoarding,
  rememberMe,
  firstName,
  lastName,
  fullName,
  image,
  phoneNumber,
  idNumber,
  licenseNumber,
  jobNumber,
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
        PrefKeys.rememberMe.toString(), isRememberMe);
  }

  Future<void> setRememberMePolice(bool isRememberMe) async {
    await _sharedPreferences.setBool(
        PrefKeys.rememberMe.toString(), isRememberMe);
  }

  Future<void> setDriverData() async {
    await _sharedPreferences.setString(PrefKeys.firstName.toString(), 'خالد');
    await _sharedPreferences.setString(PrefKeys.lastName.toString(), 'شبير');
    await _sharedPreferences.setString(
        PrefKeys.fullName.toString(), 'خالد المنعم عثمان شبير');
    await _sharedPreferences.setString(
      PrefKeys.image.toString(),
      'https://the-stock-products.s3.us-east-2.amazonaws.com/display_images/displayf004fcf1ed2fceb7dbb63496564d0386.jpg',
    );
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.toString(), '0599724037');
    await _sharedPreferences.setString(
        PrefKeys.licenseNumber.toString(), '987654321');
    await _sharedPreferences.setString(
        PrefKeys.idNumber.toString(), '407811736');
  }

  Future<void> setPoliceData() async {
    await _sharedPreferences.setString(PrefKeys.image.toString(), '');
    // await _sharedPreferences.setString(PrefKeys.phoneNumber.toString(), '');
    await _sharedPreferences.setString(PrefKeys.jobNumber.toString(), '');
    // await _sharedPreferences.setString(PrefKeys.idNumber.toString(), '');
  }

  bool getRememberMeDriver() =>
      _sharedPreferences.getBool(PrefKeys.rememberMe.toString()).onNull();

  bool getRememberMePolice() =>
      _sharedPreferences.getBool(PrefKeys.rememberMe.toString()).onNull();

  String firstName() =>
      _sharedPreferences.getString(PrefKeys.firstName.toString()).onNull();

  String lastName() =>
      _sharedPreferences.getString(PrefKeys.lastName.toString()).onNull();

  String fullName() =>
      _sharedPreferences.getString(PrefKeys.fullName.toString()).onNull();

  String image() =>
      _sharedPreferences.getString(PrefKeys.image.toString()).onNull();

  String jobNumber() =>
      _sharedPreferences.getString(PrefKeys.jobNumber.toString()).onNull();

  String idNumber() =>
      _sharedPreferences.getString(PrefKeys.idNumber.toString()).onNull();

  String licenseNumber() =>
      _sharedPreferences.getString(PrefKeys.licenseNumber.toString()).onNull();

  String phoneNumber() =>
      _sharedPreferences.getString(PrefKeys.phoneNumber.toString()).onNull();

  bool getOnBoardingViewed() =>
      _sharedPreferences.getBool(PrefKeys.onBoarding.toString()).onNull();
}
