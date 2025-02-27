import '/config/all_imports.dart';

abstract class RemotePoliceManChangePasswordDataSource {
  Future<PoliceManChangePasswordResponse> changePassword(
      PoliceManChangePasswordRequest request);
}

class RemotePoliceManChangePasswordDataSourceImpl
    extends RemotePoliceManChangePasswordDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemotePoliceManChangePasswordDataSourceImpl(
    this._appApi,
    this._sharedPreferences,
  );

  @override
  Future<PoliceManChangePasswordResponse> changePassword(
      PoliceManChangePasswordRequest request) async {
    return await _appApi.changePasswordPoliceMan(
      request.policeManId,
      request.newPassword,
      request.confirmPassword,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
