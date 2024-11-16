import '/config/all_imports.dart';

part 'payment_violation_response.g.dart';

@JsonSerializable()
class PaymentViolationResponse {
  bool? state;
  String? message;

  PaymentViolationResponse({
    required this.state,
    required this.message,
  });

  factory PaymentViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentViolationResponseFromJson(json);

  Map<String, dynamic> toJson(PaymentViolationResponse instance) =>
      _$PaymentViolationResponseToJson(this);
}
