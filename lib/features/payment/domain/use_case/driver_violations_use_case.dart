import '/config/all_imports.dart';

class DriverViolationsUseCaseInput {
  int? driverId;

  DriverViolationsUseCaseInput({
    required this.driverId,
  });
}

class DriverViolationsUseCase
    extends BaseUseCase<DriverViolationsUseCaseInput, DriverViolationsModel> {
  final DriverViolationsRepository _repository;

  DriverViolationsUseCase(this._repository);

  @override
  Future<Either<Failure, DriverViolationsModel>> execute(input) async {
    return await _repository.getDriverViolations(
      DriverViolationsRequest(
        driverId: input.driverId,
      ),
    );
  }
}
