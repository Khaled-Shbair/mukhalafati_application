import '/config/all_imports.dart';

class PoliceManChangePasswordUseCaseInput {
  int? policeManId;
  String? newPassword;
  String? confirmPassword;

  PoliceManChangePasswordUseCaseInput({
    required this.policeManId,
    required this.confirmPassword,
    required this.newPassword,
  });
}

class PoliceManChangePasswordUseCase extends BaseUseCase<
    PoliceManChangePasswordUseCaseInput, PoliceManChangePasswordModel> {
  final PoliceManChangePasswordRepository _repository;

  PoliceManChangePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, PoliceManChangePasswordModel>> execute(
      PoliceManChangePasswordUseCaseInput input) async {
    return await _repository.changePassword(
      PoliceManChangePasswordRequest(
        policeManId: input.policeManId,
        confirmPassword: input.confirmPassword,
        newPassword: input.newPassword,
      ),
    );
  }
}
