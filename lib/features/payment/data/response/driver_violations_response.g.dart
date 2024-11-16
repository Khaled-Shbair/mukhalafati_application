// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_violations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverViolationsResponse _$DriverViolationsResponseFromJson(
        Map<String, dynamic> json) =>
    DriverViolationsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DriverViolationsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DriverViolationsResponseToJson(
        DriverViolationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
