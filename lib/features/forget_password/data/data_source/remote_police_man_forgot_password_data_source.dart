import '/config/all_imports.dart';

abstract class RemotePoliceManForgotPasswordDataSource {
  Future<PoliceManForgotPasswordResponse> forgotPassword(
      PoliceManForgotPasswordRequest request);
}

class RemotePoliceManForgotPasswordDataSourceImpl
    extends RemotePoliceManForgotPasswordDataSource {
  final AppApi _appApi;

  RemotePoliceManForgotPasswordDataSourceImpl(
    this._appApi,
  );

  @override
  Future<PoliceManForgotPasswordResponse> forgotPassword(
      PoliceManForgotPasswordRequest request) async {
    return await _appApi.forgetPasswordPoliceMan(
      request.jobNumber,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
