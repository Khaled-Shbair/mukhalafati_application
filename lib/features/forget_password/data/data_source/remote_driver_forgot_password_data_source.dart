import '/config/all_imports.dart';

abstract class RemoteDriverForgotPasswordDataSource {
  Future<DriverForgotPasswordResponse> forgotPassword(
      DriverForgotPasswordRequest request);
}

class RemoteDriverForgotPasswordDataSourceImpl
    extends RemoteDriverForgotPasswordDataSource {
  final AppApi _appApi;

  RemoteDriverForgotPasswordDataSourceImpl(
    this._appApi,
  );

  @override
  Future<DriverForgotPasswordResponse> forgotPassword(
      DriverForgotPasswordRequest request) async {
    return await _appApi.forgetPasswordDriver(
      request.licenseNumber,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
