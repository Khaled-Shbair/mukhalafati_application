import '/config/all_imports.dart';

part 'home_driver_data_response.g.dart';

@JsonSerializable()
class HomeDriverDataResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.image)
  String? image;
  @JsonKey(name: ApiKeys.nameAr)
  String? nameAr;
  @JsonKey(name: ApiKeys.nameEn)
  String? nameEn;
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

  HomeDriverDataResponse({
    required this.phoneNumber,
    required this.id,
    required this.numberOfViolationsPaid,
    required this.numberOfViolationsUnPaid,
    required this.nameEn,
    required this.nameAr,
    required this.idNumber,
    required this.image,
    required this.expiryDate,
    required this.licenseLevels,
    required this.licenseNumber,
    required this.numberOfUnReadNotifications,
    required this.releaseDate,
  });

  factory HomeDriverDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDriverDataResponseFromJson(json);

  Map<String, dynamic> toJson(HomeDriverDataResponse instance) =>
      _$HomeDriverDataResponseToJson(this);
}
