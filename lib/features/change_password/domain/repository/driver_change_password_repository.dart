import '/config/all_imports.dart';

abstract class DriverChangePasswordRepository {
  Future<Either<Failure, DriverChangePasswordModel>> changePassword(
      DriverChangePasswordRequest request);
}
