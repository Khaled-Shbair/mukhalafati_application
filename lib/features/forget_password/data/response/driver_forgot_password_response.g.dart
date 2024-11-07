// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_forgot_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverForgotPasswordResponse _$DriverForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    DriverForgotPasswordResponse(
      phoneNumber: json['phone_number'] as String?,
      driverId: (json['driver_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DriverForgotPasswordResponseToJson(
        DriverForgotPasswordResponse instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'driver_id': instance.driverId,
    };
