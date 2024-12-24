// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_reasons_of_violations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfReasonsOfViolationsResponse _$ListOfReasonsOfViolationsResponseFromJson(
        Map<String, dynamic> json) =>
    ListOfReasonsOfViolationsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ReasonOfViolationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListOfReasonsOfViolationsResponseToJson(
        ListOfReasonsOfViolationsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
