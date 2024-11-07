import '/config/all_imports.dart';

part 'driver_forgot_password_response.g.dart';

@JsonSerializable()
class DriverForgotPasswordResponse {
  @JsonKey(name: ApiKeys.phoneNumber)
  String? phoneNumber;

  @JsonKey(name: ApiKeys.driverId)
  int? driverId;

  DriverForgotPasswordResponse({
    required this.phoneNumber,
    required this.driverId,
  });

  factory DriverForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson(DriverForgotPasswordResponse instance) =>
      _$DriverForgotPasswordResponseToJson(this);
}
