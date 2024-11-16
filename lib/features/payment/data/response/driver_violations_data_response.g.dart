// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_violations_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverViolationsDataResponse _$DriverViolationsDataResponseFromJson(
        Map<String, dynamic> json) =>
    DriverViolationsDataResponse(
      id: (json['id'] as num?)?.toInt(),
      violationState: json['violationState'] as String?,
      violationAddress: json['violationAddress'] as String?,
      violationTime: json['violationTime'] as String?,
      violationDate: json['violationDate'] as String?,
      violationReason: json['violationReason'] as String?,
      priceOfViolation: json['priceOfViolation'] as String?,
    );

Map<String, dynamic> _$DriverViolationsDataResponseToJson(
        DriverViolationsDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationDate': instance.violationDate,
      'violationTime': instance.violationTime,
      'violationState': instance.violationState,
      'violationAddress': instance.violationAddress,
      'violationReason': instance.violationReason,
      'priceOfViolation': instance.priceOfViolation,
    };
