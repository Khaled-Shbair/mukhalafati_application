// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'police_man_forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliceManForgotPasswordResponse _$PoliceManForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    PoliceManForgotPasswordResponse(
      phoneNumber: json['phone_number'] as String?,
      policeManId: (json['police_man_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PoliceManForgotPasswordResponseToJson(
        PoliceManForgotPasswordResponse instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'police_man_id': instance.policeManId,
    };
