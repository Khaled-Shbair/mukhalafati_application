import '/config/all_imports.dart';

class DriverForgotPasswordUseCaseInput {
  String? licenseNumber;

  DriverForgotPasswordUseCaseInput({
    required this.licenseNumber,
  });
}

class DriverForgotPasswordUseCase extends BaseUseCase<
    DriverForgotPasswordUseCaseInput, DriverForgotPasswordModel> {
  final DriverForgotPasswordRepository _repository;

  DriverForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, DriverForgotPasswordModel>> execute(
      DriverForgotPasswordUseCaseInput input) async {
    return await _repository.forgotPassword(
      DriverForgotPasswordRequest(
        input.licenseNumber,
      ),
    );
  }
}
