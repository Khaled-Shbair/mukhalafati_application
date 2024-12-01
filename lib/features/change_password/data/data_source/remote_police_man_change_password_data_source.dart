import '/config/all_imports.dart';

abstract class RemotePoliceManChangePasswordDataSource {
  Future<PoliceManChangePasswordResponse> changePassword(
      PoliceManChangePasswordRequest request);
}

class RemotePoliceManChangePasswordDataSourceImpl
    extends RemotePoliceManChangePasswordDataSource {
  final AppApi _appApi;

  RemotePoliceManChangePasswordDataSourceImpl(
    this._appApi,
  );

  @override
  Future<PoliceManChangePasswordResponse> changePassword(
      PoliceManChangePasswordRequest request) async {
    return await _appApi.changePasswordPoliceMan(
      request.policeManId,
      request.newPassword,
      request.confirmPassword,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
