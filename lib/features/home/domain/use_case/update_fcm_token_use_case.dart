import '/config/all_imports.dart';

class UpdateFcmTokenUseCaseInput {
  final String fcmToken;

  UpdateFcmTokenUseCaseInput({
    required this.fcmToken,
  });
}

class UpdateFcmTokenUseCase
    extends BaseUseCase<UpdateFcmTokenUseCaseInput, UpdateFcmTokenModel> {
  final HomeDriverRepo _repo;

  UpdateFcmTokenUseCase(this._repo);

  @override
  Future<Either<Failure, UpdateFcmTokenModel>> execute(input) async {
    return await _repo.updateDriverFcmToken(
      UpdateFcmTokenRequest(fcmToken: input.fcmToken),
    );
  }
}
