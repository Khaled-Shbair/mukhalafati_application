import '/config/all_imports.dart';

class DeleteAllNotificationsUseCase extends BaseOutUseCase<bool> {
  final NotificationsRepo _repo;

  DeleteAllNotificationsUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> execute() async {
    return await _repo.deleteAllNotifications();
  }
}
