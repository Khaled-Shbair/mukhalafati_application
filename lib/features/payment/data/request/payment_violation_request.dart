class PaymentViolationRequest {
  int? violationId;
  bool? violationState;
  String? violationPayedBy;
  String? paymentDateAndTime;

  PaymentViolationRequest({
    required this.violationId,
    required this.violationState,
    required this.violationPayedBy,
    required this.paymentDateAndTime,
  });
}
