import '/config/all_imports.dart';

abstract class DriverViolationsRepository {
  Future<Either<Failure, DriverViolationsModel>> getDriverViolations(
      DriverViolationsRequest request);
}
