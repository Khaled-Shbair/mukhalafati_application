import '/config/all_imports.dart';

part 'driver_login_response.g.dart';

@JsonSerializable()
class DriverLoginResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.image)
  String? image;
  @JsonKey(name: ApiKeys.firstNameEn)
  String? firstNameEn;
  @JsonKey(name: ApiKeys.firstNameAr)
  String? firstNameAr;
  @JsonKey(name: ApiKeys.lastNameEn)
  String? lastNameEn;
  @JsonKey(name: ApiKeys.lastNameAr)
  String? lastNameAr;
  @JsonKey(name: ApiKeys.fatherNameAr)
  String? fatherNameAr;
  @JsonKey(name: ApiKeys.fatherNameEn)
  String? fatherNameEn;
  @JsonKey(name: ApiKeys.grandFatherNameAr)
  String? grandFatherNameAr;
  @JsonKey(name: ApiKeys.grandFatherNameEn)
  String? grandFatherNameEn;
  @JsonKey(name: ApiKeys.phoneNumber)
  String? phoneNumber;
  @JsonKey(name: ApiKeys.licenseNumber)
  String? licenseNumber;
  @JsonKey(name: ApiKeys.releaseDate)
  String? releaseDate;
  @JsonKey(name: ApiKeys.expiryDate)
  String? expiryDate;
  @JsonKey(name: ApiKeys.licenseLevels)
  String? licenseLevels;
  @JsonKey(name: ApiKeys.idNumber)
  String? idNumber;
  @JsonKey(name: ApiKeys.numberOfViolationsUnPaid)
  int? numberOfViolationsUnPaid;
  @JsonKey(name: ApiKeys.numberOfViolationsPaid)
  int? numberOfViolationsPaid;
  @JsonKey(name: ApiKeys.numberOfUnReadNotifications)
  int? numberOfUnReadNotifications;

  DriverLoginResponse({
    required this.phoneNumber,
    required this.id,
    required this.numberOfViolationsPaid,
    required this.firstNameAr,
    required this.numberOfViolationsUnPaid,
    required this.fatherNameEn,
    required this.fatherNameAr,
    required this.firstNameEn,
    required this.grandFatherNameAr,
    required this.grandFatherNameEn,
    required this.idNumber,
    required this.lastNameAr,
    required this.image,
    required this.lastNameEn,
    required this.expiryDate,
    required this.licenseLevels,
    required this.licenseNumber,
    required this.numberOfUnReadNotifications,
    required this.releaseDate,
  });

  factory DriverLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverLoginResponseFromJson(json);

  Map<String, dynamic> toJson(DriverLoginResponse instance) =>
      _$DriverLoginResponseToJson(this);
}
