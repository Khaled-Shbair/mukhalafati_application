import '/config/all_imports.dart';

part 'send_request_update_profile_response.g.dart';

@JsonSerializable()
class SendRequestUpdateProfileResponse {
  @JsonKey(name: ApiKeys.status)
  bool? status;
  @JsonKey(name: ApiKeys.message)
  String? message;

  SendRequestUpdateProfileResponse({
    required this.status,
    required this.message,
  });

  factory SendRequestUpdateProfileResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SendRequestUpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SendRequestUpdateProfileResponseToJson(this);
}
