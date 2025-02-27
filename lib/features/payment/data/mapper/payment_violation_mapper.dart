import '/config/all_imports.dart';

extension PaymentViolationMapper on PaymentViolationResponse {
  toDomain() {
    return PaymentViolationModel(
      message: message.onNull(),
      state: state.onNull(),
    );
  }
}
