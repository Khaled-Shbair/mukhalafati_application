import '/config/all_imports.dart';

abstract class SendVerificationCodeRepository {
  Future<Either<Failure, SendVerificationCodeModel>> sendVerificationCode(
      SendVerificationCodeRequest request);
}
