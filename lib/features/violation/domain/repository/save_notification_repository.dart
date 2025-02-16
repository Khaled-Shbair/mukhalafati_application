import '/config/all_imports.dart';

abstract class SaveNotificationRepository {
  Future<Either<Failure, bool>> saveNotification(
      SaveNotificationRequest request);
}
