// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_complaints_for_driver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllComplaintsForDriverResponse _$GetAllComplaintsForDriverResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllComplaintsForDriverResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => ComplaintDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllComplaintsForDriverResponseToJson(
        GetAllComplaintsForDriverResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
