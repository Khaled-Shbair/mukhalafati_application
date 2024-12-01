// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_verification_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendVerificationCodeResponse _$SendVerificationCodeResponseFromJson(
        Map<String, dynamic> json) =>
    SendVerificationCodeResponse(
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SendVerificationCodeResponseToJson(
        SendVerificationCodeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
