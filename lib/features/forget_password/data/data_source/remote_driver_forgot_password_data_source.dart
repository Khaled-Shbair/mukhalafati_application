import '/config/all_imports.dart';

abstract class RemoteDriverForgotPasswordDataSource {
  Future<DriverForgotPasswordResponse> forgotPassword(
      DriverForgotPasswordRequest request);
}

class RemoteDriverForgotPasswordDataSourceImpl
    extends RemoteDriverForgotPasswordDataSource {
  final AppApi _appApi;
  final AppSettingsSharedPreferences _sharedPreferences;

  RemoteDriverForgotPasswordDataSourceImpl(
    this._appApi,
    this._sharedPreferences,
  );

  @override
  Future<DriverForgotPasswordResponse> forgotPassword(
      DriverForgotPasswordRequest request) async {
    return await _appApi.forgetPasswordDriver(
      request.licenseNumber,
      _sharedPreferences.getLanguage(),
    );
  }
}
