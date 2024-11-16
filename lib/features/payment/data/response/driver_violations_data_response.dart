import '/config/all_imports.dart';

part 'driver_violations_data_response.g.dart';

@JsonSerializable()
class DriverViolationsDataResponse {
  int? id;
  String? violationDate;
  String? violationTime;
  String? violationState;
  String? violationAddress;
  String? violationReason;
  String? priceOfViolation;


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

  Map<String, dynamic> toJson(DriverViolationsDataResponse instance) =>
      _$DriverViolationsDataResponseToJson(this);
}
