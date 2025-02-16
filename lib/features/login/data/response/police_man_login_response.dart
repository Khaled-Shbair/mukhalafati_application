import '/config/all_imports.dart';

part 'police_man_login_response.g.dart';

@JsonSerializable()
class PoliceManLoginResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.nameEn)
  String? nameEn;
  @JsonKey(name: ApiKeys.nameAr)
  String? nameAr;
  @JsonKey(name: ApiKeys.image)
  String? image;
  @JsonKey(name: ApiKeys.jobNumber)
  String? jobNumber;
  @JsonKey(name: ApiKeys.phoneNumber)
  String? phoneNumber;
  @JsonKey(name: ApiKeys.militaryRank)
  String? militaryRank;

  PoliceManLoginResponse({
    required this.id,
    required this.phoneNumber,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.jobNumber,
    required this.militaryRank,
  });

  factory PoliceManLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PoliceManLoginResponseFromJson(json);

  Map<String, dynamic> toJson(PoliceManLoginResponse instance) =>
      _$PoliceManLoginResponseToJson(this);
}
