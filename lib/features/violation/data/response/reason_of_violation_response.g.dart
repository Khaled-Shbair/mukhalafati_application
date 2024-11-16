// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_of_violation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasonOfViolationResponse _$ReasonOfViolationResponseFromJson(
        Map<String, dynamic> json) =>
    ReasonOfViolationResponse(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ReasonOfViolationResponseToJson(
        ReasonOfViolationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'reason': instance.reason,
    };
