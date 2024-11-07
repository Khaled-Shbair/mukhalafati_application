import '/config/all_imports.dart';

abstract class RemoteDriverChangePasswordDataSource {
  Future<DriverChangePasswordResponse> changePassword(
      DriverChangePasswordRequest request);
}

class RemoteDriverChangePasswordDataSourceImpl
    extends RemoteDriverChangePasswordDataSource {
  final AppApi _appApi;
  final AppSettingsSharedPreferences _sharedPreferences;

  RemoteDriverChangePasswordDataSourceImpl(
    this._appApi,
    this._sharedPreferences,
  );

  @override
  Future<DriverChangePasswordResponse> changePassword(
      DriverChangePasswordRequest request) async {
    return await _appApi.changePasswordDriver(
      request.driverId,
      request.newPassword,
      request.confirmPassword,
      _sharedPreferences.getLanguage(),
    );
  }
}
