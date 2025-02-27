import '/config/all_imports.dart';

abstract class RemoteHomeDriverDataSource {
  Future<HomeDriverDataResponse> getHomeDriverData();
}

class RemoteHomeDriverDataSourceImpl extends RemoteHomeDriverDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteHomeDriverDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<HomeDriverDataResponse> getHomeDriverData() async {
    return await _appApi.getHomeDriverData(
      _sharedPreferences.getInt(SharedPreferencesKeys.userId),
    );
  }
}
