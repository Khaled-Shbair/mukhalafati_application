import '/config/all_imports.dart';

part 'update_fcm_token_response.g.dart';

@JsonSerializable()
class UpdateFcmTokenResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;
  @JsonKey(name: ApiKeys.status)
  bool? status;

  UpdateFcmTokenResponse({
    required this.status,
    required this.message,
  });

  factory UpdateFcmTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenResponseFromJson(json);

  Map<String, dynamic> toJson(UpdateFcmTokenResponse instance) =>
      _$UpdateFcmTokenResponseToJson(this);
}
