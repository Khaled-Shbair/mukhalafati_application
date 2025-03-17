import '/config/all_imports.dart';

abstract class RemoteSaveNotificationDataSource {
  Future<void> saveNotification(SaveNotificationRequest request);
}

class RemoteSaveNotificationDataSourceImpl
    extends RemoteSaveNotificationDataSource {
  final AppApi _appApi;

  RemoteSaveNotificationDataSourceImpl(this._appApi);

  @override
  Future<void> saveNotification(SaveNotificationRequest request) async {
    return await _appApi.saveNotification(
      request.driverId,
      request.title,
      request.content,
      request.timeSend
    );
  }
}
