import '/config/all_imports.dart';

part 'all_reasons_of_violation_response.g.dart';

@JsonSerializable()
class AllReasonsOfViolationResponse {
  @JsonKey(name: ApiKeys.data)
  List<ReasonOfViolationResponse>? data;

  AllReasonsOfViolationResponse({
    required this.data,
  });

  factory AllReasonsOfViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$AllReasonsOfViolationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllReasonsOfViolationResponseToJson(this);
}

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

  Map<String, dynamic> toJson() => _$ReasonOfViolationResponseToJson(this);
}
