// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_violation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentViolationResponse _$PaymentViolationResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentViolationResponse(
      state: json['state'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaymentViolationResponseToJson(
        PaymentViolationResponse instance) =>
    <String, dynamic>{
      'state': instance.state,
      'message': instance.message,
    };
