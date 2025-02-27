import '/config/all_imports.dart';

part 'police_man_forgot_password_response.g.dart';

@JsonSerializable()
class PoliceManForgotPasswordResponse {
  @JsonKey(name: ApiKeys.phoneNumber)
  String? phoneNumber;
  @JsonKey(name: ApiKeys.policeManId)
  int? policeManId;

  PoliceManForgotPasswordResponse({
    required this.phoneNumber,
    required this.policeManId,
  });

  factory PoliceManForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$PoliceManForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson(PoliceManForgotPasswordResponse instance) =>
      _$PoliceManForgotPasswordResponseToJson(this);
}
