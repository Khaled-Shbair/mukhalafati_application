import '/config/all_imports.dart';

class VerifyOtpCodeUseCaseInput {
  final String smsCode;
  final String verificationId;

  VerifyOtpCodeUseCaseInput({
    required this.verificationId,
    required this.smsCode,
  });
}

class VerifyOtpCodeUseCase
    extends BaseUseCase<VerifyOtpCodeUseCaseInput, OtpCodeModel> {
  final OtpCodeRepository _repository;

  VerifyOtpCodeUseCase(this._repository);

  @override
  Future<Either<Failure, OtpCodeModel>> execute(input) async {
    return await _repository.verifyOtpCode(
      VerifyOtpRequest(
        smsCode: input.smsCode,
        verificationId: input.verificationId,
      ),
    );
  }
}
