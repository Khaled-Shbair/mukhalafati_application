import '/config/all_imports.dart';

abstract class DriverLoginRepository {
  Future<Either<Failure, DriverLoginModel>> login(DriverLoginRequest request);
}
