import '/config/all_imports.dart';

abstract class RemoteDriverLoginDataSource {
  Future<DriverLoginResponse> login(DriverLoginRequest request);
}

class RemoteLoginDataSourceImpl extends RemoteDriverLoginDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteLoginDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<DriverLoginResponse> login(DriverLoginRequest request) async {
    return await _appApi.driverLogin(
      request.licenseNumber,
      request.password,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
