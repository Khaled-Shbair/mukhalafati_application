import '/config/all_imports.dart';

abstract class LocalHomeDriverDataSource {
  Future<HomeDriverModel> getHomeDriverData();
}

class LocalHomeDriverDataSourceImpl extends LocalHomeDriverDataSource {
  final SharedPreferencesController _sharedPreferences;

  LocalHomeDriverDataSourceImpl(this._sharedPreferences);

  @override
  Future<HomeDriverModel> getHomeDriverData() async {
    return HomeDriverModel(
      numberOfUnReadNotifications: _sharedPreferences
          .getInt(SharedPreferencesKeys.numberOfUnReadNotifications),
      numberOfViolationsPaid: _sharedPreferences
          .getInt(SharedPreferencesKeys.numberOfViolationsPaid),
      numberOfViolationsUnPaid: _sharedPreferences
          .getInt(SharedPreferencesKeys.numberOfViolationsUnPaid),
      id: _sharedPreferences.getInt(SharedPreferencesKeys.userId),
      phone: _sharedPreferences.getString(SharedPreferencesKeys.phoneNumber),
      licenseLevels: _sharedPreferences
          .getString(SharedPreferencesKeys.licenseLevelsOfLicense),
      expiryDate:
          _sharedPreferences.getString(SharedPreferencesKeys.expiryDateLicense),
      idNumber: _sharedPreferences.getString(SharedPreferencesKeys.idNumber),
      licenseNumber: _sharedPreferences
          .getString(SharedPreferencesKeys.licenseOrJobNumber),
      nameAr: _sharedPreferences.getString(SharedPreferencesKeys.nameAr),
      nameEn: _sharedPreferences.getString(SharedPreferencesKeys.nameEn),
      image: _sharedPreferences.getString(SharedPreferencesKeys.image),
      releaseDate: _sharedPreferences
          .getString(SharedPreferencesKeys.releaseDateLicense),
    );
  }
}
