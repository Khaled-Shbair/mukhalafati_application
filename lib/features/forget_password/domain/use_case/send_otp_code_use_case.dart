import '/config/all_imports.dart';

class SendOtpCodeUseCaseInput {
  final String phoneNumber;

  SendOtpCodeUseCaseInput({
    required this.phoneNumber,
  });
}

class SendOtpCodeUseCase
    extends BaseUseCase<SendOtpCodeUseCaseInput, OtpCodeModel> {
  final OtpCodeRepository _repository;

  SendOtpCodeUseCase(this._repository);

  @override
  Future<Either<Failure, OtpCodeModel>> execute(input) async {
    return await _repository.sendOtpCode(
      SendOtpCodeRequest(input.phoneNumber),
    );
  }
}
