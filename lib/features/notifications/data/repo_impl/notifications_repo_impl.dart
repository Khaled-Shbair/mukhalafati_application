import '/config/all_imports.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  final RemoteNotificationsDataSource _dataSource;
  final NetworkInfo _networkInfo;

  NotificationsRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, UpdateFcmTokenModel>> updateDriverFcmToken() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.updateDriverFcmToken();
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NotificationsModel>> getAllNotifications() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllNotification();
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateNotificationStatus() async {
    if (await _networkInfo.isConnected) {
      try {
        await _dataSource.updateNotificationStatus();
        return Right(true);
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllNotifications() async {
    if (await _networkInfo.isConnected) {
      try {
        await _dataSource.deleteAllNotification();
        return Right(true);
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteDriverNotificationById(request) async {
    if (await _networkInfo.isConnected) {
      try {
        await _dataSource.deleteDriverNotificationById(request);
        return Right(true);
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }
}
