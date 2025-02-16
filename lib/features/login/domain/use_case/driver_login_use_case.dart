import '/config/all_imports.dart';

class DriverLoginInput {
  String? licenseNumber;
  String? password;

  DriverLoginInput({
    required this.licenseNumber,
    required this.password,
  });
}

class DriverLoginUseCase
    implements BaseUseCase<DriverLoginInput, DriverLoginModel> {
  final DriverLoginRepository _driverLoginRepository;

  DriverLoginUseCase(this._driverLoginRepository);

  @override
  Future<Either<Failure, DriverLoginModel>> execute(
      DriverLoginInput input) async {
    return await _driverLoginRepository.login(
      DriverLoginRequest(
        licenseNumber: input.licenseNumber,
        password: input.password,
      ),
    );
  }
}
