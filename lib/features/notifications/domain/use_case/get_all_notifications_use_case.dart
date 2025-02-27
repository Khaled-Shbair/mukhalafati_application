import '/config/all_imports.dart';

class GetAllNotificationsUseCase extends BaseOutUseCase<NotificationsModel> {
  final NotificationsRepo _repo;

  GetAllNotificationsUseCase(this._repo);

  @override
  Future<Either<Failure, NotificationsModel>> execute() async {
    return await _repo.getAllNotifications();
  }
}
