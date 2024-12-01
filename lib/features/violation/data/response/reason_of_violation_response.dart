import '/config/all_imports.dart';

part 'reason_of_violation_response.g.dart';

@JsonSerializable()
class ReasonOfViolationResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.price)
  double? price;
  @JsonKey(name: ApiKeys.reason)
  String? reason;

  ReasonOfViolationResponse({
    required this.id,
    required this.price,
    required this.reason,
  });

  factory ReasonOfViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReasonOfViolationResponseFromJson(json);

  Map<String, dynamic> toJson(ReasonOfViolationResponse instance) =>
      _$ReasonOfViolationResponseToJson(this);
}
