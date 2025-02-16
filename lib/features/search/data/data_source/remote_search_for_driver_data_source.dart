
import '/config/all_imports.dart';

abstract class RemoteSearchForDriverDataSource {
  Future<SearchForDriverResponse> searchForDriver(
      SearchForDriverRequest request);
}

class RemoteSearchForDriverDataSourceImpl
    extends RemoteSearchForDriverDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteSearchForDriverDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<SearchForDriverResponse> searchForDriver(
      SearchForDriverRequest request) async {
    return await _appApi.searchForDriver(
      request.licenseNumber,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
