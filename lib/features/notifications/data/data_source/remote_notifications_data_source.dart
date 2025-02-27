import '/config/all_imports.dart';

abstract class RemoteNotificationsDataSource {
  Future<UpdateFcmTokenResponse> updateDriverFcmToken();

  Future<NotificationsResponse> getAllNotification();

  Future deleteAllNotification();

  Future deleteDriverNotificationById(DeleteDriverNotificationRequest request);

  Future updateNotificationStatus();
}

class RemoteNotificationsDataSourceImpl extends RemoteNotificationsDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteNotificationsDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<UpdateFcmTokenResponse> updateDriverFcmToken() async {
    String? fcmToken = await instance<FirebaseMessaging>().getToken();
    if (fcmToken != null) {
      _sharedPreferences.setData(SharedPreferencesKeys.fcm, fcmToken);
      return await _appApi.updateDriverFcmToken(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId),
        fcmToken,
        _sharedPreferences.getString(SharedPreferencesKeys.language),
      );
    } else {
      return await _appApi.updateDriverFcmToken(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId),
        _sharedPreferences.getString(SharedPreferencesKeys.fcm),
        _sharedPreferences.getString(SharedPreferencesKeys.language),
      );
    }
  }

  @override
  Future<NotificationsResponse> getAllNotification() async {
    return await _appApi.getAllNotification(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId));
  }

  @override
  Future updateNotificationStatus() async {
    return await _appApi.updateNotificationStatus(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId));
  }

  @override
  Future deleteAllNotification() async {
    return await _appApi.deleteAllNotification(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId));
  }

  @override
  Future deleteDriverNotificationById(
      DeleteDriverNotificationRequest request) async {
    return await _appApi.deleteDriverNotificationById(
        _sharedPreferences.getInt(SharedPreferencesKeys.userId),
        request.notificationId);
  }
}
