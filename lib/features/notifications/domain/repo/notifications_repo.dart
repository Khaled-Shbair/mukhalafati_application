import '/config/all_imports.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, UpdateFcmTokenModel>> updateDriverFcmToken();

  Future<Either<Failure, NotificationsModel>> getAllNotifications();

  Future<Either<Failure, bool>> updateNotificationStatus();
  Future<Either<Failure, bool>> deleteAllNotifications();
  Future<Either<Failure, bool>> deleteDriverNotificationById(DeleteDriverNotificationRequest request);
}
