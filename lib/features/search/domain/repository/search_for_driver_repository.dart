import '/config/all_imports.dart';

abstract class SearchForDriverRepository {
  Future<Either<Failure, SearchForDriverModel>> searchForDriver(
      SearchForDriverRequest request);
}
