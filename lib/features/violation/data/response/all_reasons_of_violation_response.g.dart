// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_reasons_of_violation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllReasonsOfViolationResponse _$AllReasonsOfViolationResponseFromJson(
        Map<String, dynamic> json) =>
    AllReasonsOfViolationResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ReasonOfViolationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllReasonsOfViolationResponseToJson(
        AllReasonsOfViolationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

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
