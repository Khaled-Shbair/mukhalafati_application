import '/config/all_imports.dart';

part 'send_verification_code_response.g.dart';

@JsonSerializable()
class SendVerificationCodeResponse {
  int? code;

  SendVerificationCodeResponse({
    required this.code,
  });

  factory SendVerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendVerificationCodeResponseFromJson(json);

  Map<String, dynamic> toJson(SendVerificationCodeResponse instance) =>
      _$SendVerificationCodeResponseToJson(this);
}
