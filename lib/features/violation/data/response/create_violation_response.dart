import '/config/all_imports.dart';

part 'create_violation_response.g.dart';

@JsonSerializable()
class CreateViolationResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;
  @JsonKey(name: ApiKeys.status)
  bool? status;
  @JsonKey(name: ApiKeys.fcmToken)
  String? fcmToken;
  @JsonKey(name: ApiKeys.driverId)
  int? driverId;
  CreateViolationResponse({
    required this.message,
    required this.fcmToken,
    required this.status,
    required this.driverId,
  });

  factory CreateViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateViolationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateViolationResponseToJson(this);
}
