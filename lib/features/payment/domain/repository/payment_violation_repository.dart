import '/config/all_imports.dart';

abstract class PaymentViolationRepository {
  Future<Either<Failure, PaymentViolationModel>> paymentViolation(
      PaymentViolationRequest request);
}
