import '/config/all_imports.dart';

abstract class RemotePoliceManLoginDataSource {
  Future<PoliceManLoginResponse> login(PoliceManLoginRequest request);
}

class RemotePoliceManLoginDataSourceImpl
    extends RemotePoliceManLoginDataSource {
  final AppApi _appApi;

  RemotePoliceManLoginDataSourceImpl(this._appApi);

  @override
  Future<PoliceManLoginResponse> login(PoliceManLoginRequest request) async {
    return await _appApi.policeManLogin(
      request.jobNumber,
      request.password,
      SharedPreferencesController.getString(SharedPreferencesKeys.language),
    );
  }
}
