import '/config/all_imports.dart';

abstract class HomeDriverRepo {
  Future<Either<Failure, HomeDriverModel>> getHomeDriverData();
}
