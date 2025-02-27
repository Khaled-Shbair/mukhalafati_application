import '/config/all_imports.dart';

abstract class PoliceManForgotPasswordRepository {
  Future<Either<Failure, PoliceManForgotPasswordModel>> forgotPassword(
      PoliceManForgotPasswordRequest request);
}
