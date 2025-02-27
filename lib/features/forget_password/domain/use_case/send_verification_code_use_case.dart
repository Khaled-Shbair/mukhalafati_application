import '/config/all_imports.dart';

class SendVerificationInputCodeUseCase {
  String? phoneNumber;

  SendVerificationInputCodeUseCase({
    required this.phoneNumber,
  });
}

class SendVerificationCodeUseCase extends BaseUseCase<
    SendVerificationInputCodeUseCase, SendVerificationCodeModel> {
  final SendVerificationCodeRepository _repository;

  SendVerificationCodeUseCase(this._repository);

  @override
  Future<Either<Failure, SendVerificationCodeModel>> execute(input) async {
    return await _repository.sendVerificationCode(
      SendVerificationCodeRequest(
        input.phoneNumber,
      ),
    );
  }
}
