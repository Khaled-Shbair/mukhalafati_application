import '/config/all_imports.dart';

abstract class RemoteDriverLoginDataSource {
  Future<DriverLoginResponse> login(DriverLoginRequest request);
}

class RemoteLoginDataSourceImpl extends RemoteDriverLoginDataSource {
  final AppApi _appApi;

  RemoteLoginDataSourceImpl(this._appApi);

  @override
  Future<DriverLoginResponse> login(DriverLoginRequest request) async {
    return await _appApi.driverLogin(
      request.licenseNumber,
      request.password,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
