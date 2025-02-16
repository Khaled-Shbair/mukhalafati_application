import '/config/all_imports.dart';

abstract class RemotePoliceManForgotPasswordDataSource {
  Future<PoliceManForgotPasswordResponse> forgotPassword(
      PoliceManForgotPasswordRequest request);
}

class RemotePoliceManForgotPasswordDataSourceImpl
    extends RemotePoliceManForgotPasswordDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemotePoliceManForgotPasswordDataSourceImpl(
    this._appApi,
    this._sharedPreferences,
  );

  @override
  Future<PoliceManForgotPasswordResponse> forgotPassword(
      PoliceManForgotPasswordRequest request) async {
    return await _appApi.forgetPasswordPoliceMan(
      request.jobNumber,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
