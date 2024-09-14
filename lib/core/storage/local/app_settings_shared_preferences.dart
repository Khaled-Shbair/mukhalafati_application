import '/config/all_imports.dart';

enum PrefKeys {
  onBoarding,
}

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> clear() => _sharedPreferences.clear();

  Future<void> setOnBoardingViewed() async {
    _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

  bool getOnBoardingViewed() {
    return _sharedPreferences.getBool(PrefKeys.onBoarding.toString()).onNull();
  }
}
