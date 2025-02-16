import '/config/all_imports.dart';

abstract class DriverForgotPasswordRepository {
  Future<Either<Failure, DriverForgotPasswordModel>> forgotPassword(
      DriverForgotPasswordRequest request);
}
