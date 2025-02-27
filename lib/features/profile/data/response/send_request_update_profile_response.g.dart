// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_request_update_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendRequestUpdateProfileResponse _$SendRequestUpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    SendRequestUpdateProfileResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendRequestUpdateProfileResponseToJson(
        SendRequestUpdateProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
