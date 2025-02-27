import '/config/all_imports.dart';

part 'driver_violations_response.g.dart';

@JsonSerializable()
class DriverViolationsResponse {
  @JsonKey(name: ApiKeys.data)
  List<DriverViolationsDataResponse>? data;

  DriverViolationsResponse({
    required this.data,
  });

  factory DriverViolationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverViolationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DriverViolationsResponseToJson(this);
}

@JsonSerializable()
class DriverViolationsDataResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.violationDate)
  String? violationDate;
  @JsonKey(name: ApiKeys.violationTime)
  String? violationTime;
  @JsonKey(name: ApiKeys.violationState)
  bool? violationState;
  @JsonKey(name: ApiKeys.violationAddress)
  String? violationAddress;
  @JsonKey(name: ApiKeys.violationReason)
  String? violationReason;
  @JsonKey(name: ApiKeys.priceOfViolation)
  num? priceOfViolation;

  DriverViolationsDataResponse({
    required this.id,
    required this.violationState,
    required this.violationAddress,
    required this.violationTime,
    required this.violationDate,
    required this.violationReason,
    required this.priceOfViolation,
  });

  factory DriverViolationsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverViolationsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DriverViolationsDataResponseToJson(this);
}
