import '/config/all_imports.dart';

class PoliceManForgotPasswordUseCaseInput {
  String? jobNumber;

  PoliceManForgotPasswordUseCaseInput({
    required this.jobNumber,
  });
}

class PoliceManForgotPasswordUseCase extends BaseUseCase<
    PoliceManForgotPasswordUseCaseInput, PoliceManForgotPasswordModel> {
  final PoliceManForgotPasswordRepository _repository;

  PoliceManForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, PoliceManForgotPasswordModel>> execute(
      PoliceManForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      PoliceManForgotPasswordRequest(
        input.jobNumber,
      ),
    );
  }
}
