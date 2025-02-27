import '/config/all_imports.dart';

class DriverViolationsUseCaseInput {
  final int driverId;
  final int page;
  final int limit;

  DriverViolationsUseCaseInput({
    required this.driverId,
    required this.page,
    required this.limit,
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
        page: input.page,
        limit: input.limit,
      ),
    );
  }
}
