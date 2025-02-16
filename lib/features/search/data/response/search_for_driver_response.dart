import '/config/all_imports.dart';

part 'search_for_driver_response.g.dart';

@JsonSerializable()
class SearchForDriverResponse {
  @JsonKey(name: ApiKeys.licenseNumber)
  String? licenseNumber;
  @JsonKey(name: ApiKeys.expiryDate)
  String? expiryDate;
  @JsonKey(name: ApiKeys.releaseDate)
  String? releaseDate;
  @JsonKey(name: ApiKeys.idNumber)
  String? idNumber;
  @JsonKey(name: ApiKeys.nameAr)
  String? nameAr;
  @JsonKey(name: ApiKeys.nameEn)
  String? nameEn;
  @JsonKey(name: ApiKeys.licenseLevels)
  String? licenseLevels;
  @JsonKey(name: ApiKeys.image)
  String? imageDriver;
  @JsonKey(name: ApiKeys.numberOfViolations)
  int? numberOfViolations;
  @JsonKey(name: ApiKeys.message)
  String? message;
  @JsonKey(name: ApiKeys.status)
  bool? status;

  SearchForDriverResponse({
    required this.licenseNumber,
    required this.idNumber,
    required this.expiryDate,
    required this.licenseLevels,
    required this.releaseDate,
    required this.imageDriver,
    required this.nameAr,
    required this.nameEn,
    required this.message,
    required this.status,
    required this.numberOfViolations,
  });

  factory SearchForDriverResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchForDriverResponseFromJson(json);

  Map<String, dynamic> toJson(SearchForDriverResponse instance) =>
      _$SearchForDriverResponseToJson(this);
}
