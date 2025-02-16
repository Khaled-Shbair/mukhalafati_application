import '/config/all_imports.dart';

part 'get_violation_details_response.g.dart';

@JsonSerializable()
class GetViolationDetailsResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.ownerName)
  String? ownerName;
  @JsonKey(name: ApiKeys.ownerIdNumber)
  String? ownerIdNumber;
  @JsonKey(name: ApiKeys.driverName)
  String? driverName;
  @JsonKey(name: ApiKeys.policeName)
  String? policeName;
  @JsonKey(name: ApiKeys.violationDate)
  String? violationDate;
  @JsonKey(name: ApiKeys.violationTime)
  String? violationTime;
  @JsonKey(name: ApiKeys.driverIdNumber)
  String? driverIdNumber;
  @JsonKey(name: ApiKeys.violationReason)
  String? violationReason;
  @JsonKey(name: ApiKeys.violationAddress)
  String? violationAddress;
  @JsonKey(name: ApiKeys.vehicleColor)
  String? vehicleColor;
  @JsonKey(name: ApiKeys.vehicleType)
  String? vehicleType;
  @JsonKey(name: ApiKeys.vehicleNumber)
  String? vehicleNumber;

  GetViolationDetailsResponse({
    required this.vehicleNumber,
    required this.vehicleType,
    required this.vehicleColor,
    required this.violationAddress,
    required this.violationReason,
    required this.driverIdNumber,
    required this.violationTime,
    required this.violationDate,
    required this.policeName,
    required this.driverName,
    required this.ownerIdNumber,
    required this.ownerName,
    required this.id,
  });

  factory GetViolationDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetViolationDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetViolationDetailsResponseToJson(this);
}
