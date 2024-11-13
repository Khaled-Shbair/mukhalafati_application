import '/config/all_imports.dart';

abstract class CreateComplaintRepository {
  Future<Either<Failure, CreateComplaintModel>> createComplaint(
      CreateComplaintRequest request);
}
