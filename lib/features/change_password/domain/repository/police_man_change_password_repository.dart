import '/config/all_imports.dart';

abstract class PoliceManChangePasswordRepository {
  Future<Either<Failure, PoliceManChangePasswordModel>> changePassword(
      PoliceManChangePasswordRequest request);
}
