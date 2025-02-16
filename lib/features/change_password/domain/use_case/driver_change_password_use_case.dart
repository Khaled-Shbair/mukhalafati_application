import '/config/all_imports.dart';

class DriverChangePasswordUseCaseInput {
  int? driverId;
  String? newPassword;
  String? confirmPassword;

  DriverChangePasswordUseCaseInput({
    required this.driverId,
    required this.confirmPassword,
    required this.newPassword,
  });
}

class DriverChangePasswordUseCase extends BaseUseCase<
    DriverChangePasswordUseCaseInput, DriverChangePasswordModel> {
  final DriverChangePasswordRepository _repository;

  DriverChangePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, DriverChangePasswordModel>> execute(
      DriverChangePasswordUseCaseInput input) async {
    return await _repository.changePassword(
      DriverChangePasswordRequest(
        driverId: input.driverId,
        confirmPassword: input.confirmPassword,
        newPassword: input.newPassword,
      ),
    );
  }
}
