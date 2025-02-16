import '/config/all_imports.dart';

abstract class RemotePoliceManLoginDataSource {
  Future<PoliceManLoginResponse> login(PoliceManLoginRequest request);
}

class RemotePoliceManLoginDataSourceImpl
    extends RemotePoliceManLoginDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemotePoliceManLoginDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<PoliceManLoginResponse> login(PoliceManLoginRequest request) async {
    return await _appApi.policeManLogin(
      request.jobNumber,
      request.password,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
