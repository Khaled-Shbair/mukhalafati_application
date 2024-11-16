import '/config/all_imports.dart';

abstract class ReasonOfViolationRepository {
  Future<Either<Failure, ReasonOfViolationModel>> reasonOfViolation(
      ReasonOfViolationRequest request);
}
