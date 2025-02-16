import '/config/all_imports.dart';

abstract class ViolationRepository {
  Future<Either<Failure, CreateViolationModel>> createViolation(
      CreateViolationRequest request);

  Future<Either<Failure, AllViolationModel>> getAllViolation(
      AllViolationRequest request);

  Future<Either<Failure, AllReasonsOfViolationModel>>
      getAllReasonsForViolation();

  Future<Either<Failure, GetViolationDetailsModel>> getViolationDetailsById(
      GetViolationDetailsRequest request);
}
