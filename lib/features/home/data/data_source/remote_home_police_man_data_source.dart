import '/config/all_imports.dart';

abstract class RemoteHomePoliceManDataSource {
  Future<HomePoliceManResponse> homePoliceMan();
}

class RemoteHomePoliceManDataSourceImpl extends RemoteHomePoliceManDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteHomePoliceManDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<HomePoliceManResponse> homePoliceMan() async {
    return await _appApi.homePoliceMan(
      _sharedPreferences.getInt(SharedPreferencesKeys.userId),
    );
  }
}
