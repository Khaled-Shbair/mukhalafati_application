import '/config/all_imports.dart';

class DeleteDriverNotificationsInput {
  final int notificationId;

  DeleteDriverNotificationsInput({
    required this.notificationId,
  });
}

class DeleteDriverNotificationsByIdUseCase
    extends BaseUseCase<DeleteDriverNotificationsInput, bool> {
  final NotificationsRepo _repo;

  DeleteDriverNotificationsByIdUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> execute(input) async {
    return await _repo.deleteDriverNotificationById(
        DeleteDriverNotificationRequest(notificationId: input.notificationId));

  }
}
