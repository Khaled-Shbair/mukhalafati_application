import '/config/all_imports.dart';

abstract class OtpCodeRepository {
  Future<Either<Failure, OtpCodeModel>> sendOtpCode(
      SendOtpCodeRequest request);
  Future<Either<Failure, OtpCodeModel>> verifyOtpCode(
      VerifyOtpRequest request);
}
