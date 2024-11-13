// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_of_violation_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasonOfViolationDataResponse _$ReasonOfViolationDataResponseFromJson(
        Map<String, dynamic> json) =>
    ReasonOfViolationDataResponse(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ReasonOfViolationDataResponseToJson(
        ReasonOfViolationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'reason': instance.reason,
    };
