import '/config/all_imports.dart';

abstract class GetAllComplaintsRepository {
  Future<Either<Failure, GetAllComplaintsModel>> getAllComplaints(
      GetAllComplaintsRequest request);
}
