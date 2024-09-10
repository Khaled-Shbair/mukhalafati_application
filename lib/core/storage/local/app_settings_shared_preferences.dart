import '/config/all_imports.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOnBoardingViewed() async {
    _sharedPreferences.setBool(PrefKeysConstants.setOnBoardingViewed, true);
  }

  bool getOnBoardingViewed() {
    return _sharedPreferences
        .getBool(PrefKeysConstants.setOnBoardingViewed)
        .onNull();
  }
}
