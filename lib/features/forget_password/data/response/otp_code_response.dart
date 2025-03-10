import '/config/all_imports.dart';

part 'otp_code_response.g.dart';

@JsonSerializable()
class OtpCodeResponse {
  String? message;
  bool? status;

  OtpCodeResponse({
    required this.status,
    required this.message,
  });

  factory OtpCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpCodeResponseFromJson(json);

  Map<String, dynamic> toJson(OtpCodeResponse instance) =>
      _$OtpCodeResponseToJson(this);
}
