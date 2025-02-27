// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_fcm_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFcmTokenResponse _$UpdateFcmTokenResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateFcmTokenResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UpdateFcmTokenResponseToJson(
        UpdateFcmTokenResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
