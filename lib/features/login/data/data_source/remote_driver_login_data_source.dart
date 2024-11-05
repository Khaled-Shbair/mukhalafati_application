import '/config/all_imports.dart';

abstract class RemoteLoginDataSource {
  Future<DriverLoginResponse> login(DriverLoginRequest request);
}

class RemoteLoginDataSourceImplementation extends RemoteLoginDataSource {
  final AppApi _appApi;
  final AppSettingsSharedPreferences _sharedPreferences;

  RemoteLoginDataSourceImplementation(this._appApi, this._sharedPreferences);

  @override
  Future<DriverLoginResponse> login(DriverLoginRequest request) async {
    return await _appApi.driverLogin(
      request.licenseNumber,
      request.password,
      _sharedPreferences.getLanguage(),
    );
  }
}
