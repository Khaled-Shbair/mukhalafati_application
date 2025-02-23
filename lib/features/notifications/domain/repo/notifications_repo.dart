import '/config/all_imports.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, UpdateFcmTokenModel>> updateDriverFcmToken();
}
