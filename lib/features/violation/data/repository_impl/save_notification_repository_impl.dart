import '/config/all_imports.dart';

class SaveNotificationRepositoryImpl extends SaveNotificationRepository {
  final RemoteSaveNotificationDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SaveNotificationRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, bool>> saveNotification(
      SaveNotificationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        await _dataSource.saveNotification(request);
        return Right(true);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
          message: ManagerStrings.noInternetConnection,
        ),
      );
    }
  }
}
