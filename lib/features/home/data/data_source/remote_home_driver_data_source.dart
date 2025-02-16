import '/config/all_imports.dart';

abstract class RemoteHomeDriverDataSource {
  Future<UpdateFcmTokenResponse> updateDriverFcmToken(UpdateFcmTokenRequest request);
}

class RemoteHomeDriverDataSourceImpl
    extends RemoteHomeDriverDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteHomeDriverDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<UpdateFcmTokenResponse> updateDriverFcmToken(
      UpdateFcmTokenRequest request) async {
    return await _appApi.updateDriverFcmToken(
      _sharedPreferences.getInt(SharedPreferencesKeys.userId),
      request.fcmToken,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
    );
  }
}
