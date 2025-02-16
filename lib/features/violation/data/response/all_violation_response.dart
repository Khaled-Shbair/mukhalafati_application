import '/config/all_imports.dart';

part 'all_violation_response.g.dart';

@JsonSerializable()
class AllViolationResponse {
  @JsonKey(name: ApiKeys.data)
  List<ViolationResponse> data;

  AllViolationResponse({
    required this.data,
  });

  factory AllViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$AllViolationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllViolationResponseToJson(this);
}

@JsonSerializable()
class ViolationResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.driverName)
  String? driverName;
  @JsonKey(name: ApiKeys.violationAddress)
  String? violationAddress;
  @JsonKey(name: ApiKeys.violationDate)
  String? violationDate;

  ViolationResponse({
    required this.violationDate,
    required this.violationAddress,
    required this.driverName,
    required this.id,
  });

  factory ViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$ViolationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationResponseToJson(this);
}
