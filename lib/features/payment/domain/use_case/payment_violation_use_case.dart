import '/config/all_imports.dart';

class PaymentViolationUseCaseInput {
  String? paymentDateAndTime;
  String? violationPayedBy;
  int? violationId;
  bool? violationState;

  PaymentViolationUseCaseInput({
    required this.violationId,
    required this.violationState,
    required this.violationPayedBy,
    required this.paymentDateAndTime,
  });
}

class PaymentViolationUseCase
    extends BaseUseCase<PaymentViolationUseCaseInput, PaymentViolationModel> {
  final PaymentViolationRepository _repository;

  PaymentViolationUseCase(this._repository);

  @override
  Future<Either<Failure, PaymentViolationModel>> execute(input) async {
    return await _repository.paymentViolation(
      PaymentViolationRequest(
        paymentDateAndTime: input.paymentDateAndTime,
        violationPayedBy: input.violationPayedBy,
        violationState: input.violationState,
        violationId: input.violationId,
      ),
    );
  }
}
