import '/config/all_imports.dart';

abstract class RemoteDriverChangePasswordDataSource {
  Future<DriverChangePasswordResponse> changePassword(
      DriverChangePasswordRequest request);
}

class RemoteDriverChangePasswordDataSourceImpl
    extends RemoteDriverChangePasswordDataSource {
  final AppApi _appApi;

  RemoteDriverChangePasswordDataSourceImpl(
    this._appApi,
  );

  @override
  Future<DriverChangePasswordResponse> changePassword(
      DriverChangePasswordRequest request) async {
    return await _appApi.changePasswordDriver(
      request.driverId,
      request.newPassword,
      request.confirmPassword,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
