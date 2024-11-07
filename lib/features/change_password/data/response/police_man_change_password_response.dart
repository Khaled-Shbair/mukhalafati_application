import '/config/all_imports.dart';

part 'police_man_change_password_response.g.dart';

@JsonSerializable()
class PoliceManChangePasswordResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;

  PoliceManChangePasswordResponse({required this.message,
  });

  factory PoliceManChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$PoliceManChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson(PoliceManChangePasswordResponse instance) =>
      _$PoliceManChangePasswordResponseToJson(this);
}
