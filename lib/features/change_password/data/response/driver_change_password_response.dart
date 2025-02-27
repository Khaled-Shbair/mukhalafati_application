import '/config/all_imports.dart';

part 'driver_change_password_response.g.dart';

@JsonSerializable()
class DriverChangePasswordResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;

  DriverChangePasswordResponse({
    required this.message,
  });

  factory DriverChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson(DriverChangePasswordResponse instance) =>
      _$DriverChangePasswordResponseToJson(this);
}
