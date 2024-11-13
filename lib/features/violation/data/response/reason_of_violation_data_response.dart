import '/config/all_imports.dart';

part 'reason_of_violation_data_response.g.dart';

@JsonSerializable()
class ReasonOfViolationDataResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.price)
  double? price;
  @JsonKey(name: ApiKeys.reason)
  String? reason;

  ReasonOfViolationDataResponse({
    required this.id,
    required this.price,
    required this.reason,
  });

  factory ReasonOfViolationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReasonOfViolationDataResponseFromJson(json);

  Map<String, dynamic> toJson(ReasonOfViolationDataResponse instance) =>
      _$ReasonOfViolationDataResponseToJson(this);
}
