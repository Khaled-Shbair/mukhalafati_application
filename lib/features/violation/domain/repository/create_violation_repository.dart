import '/config/all_imports.dart';

abstract class CreateViolationRepository {
  Future<Either<Failure, CreateViolationModel>> createViolation(
      CreateViolationRequest request);
}
