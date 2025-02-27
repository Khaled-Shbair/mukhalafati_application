import '/config/all_imports.dart';

class UpdateNotificationStatusUseCase extends BaseOutUseCase<bool> {
  final NotificationsRepo _repo;

  UpdateNotificationStatusUseCase(this._repo);

  @override
  Future<Either<Failure, bool>> execute() async {
    return await _repo.updateNotificationStatus();
  }
}
