import '/config/all_imports.dart';

class UpdateFcmTokenUseCase extends BaseOutUseCase<UpdateFcmTokenModel> {
  final NotificationsRepo _repo;

  UpdateFcmTokenUseCase(this._repo);

  @override
  Future<Either<Failure, UpdateFcmTokenModel>> execute() async {
    return await _repo.updateDriverFcmToken();
  }
}
