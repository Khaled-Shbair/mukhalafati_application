// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintDataResponse _$ComplaintDataResponseFromJson(
        Map<String, dynamic> json) =>
    ComplaintDataResponse(
      detailOfComplaint: json['detail_of_complaint'] as String?,
      dateOfIncidentOrProblem: json['date_of_incident_or_problem'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$ComplaintDataResponseToJson(
        ComplaintDataResponse instance) =>
    <String, dynamic>{
      'detail_of_complaint': instance.detailOfComplaint,
      'date_of_incident_or_problem': instance.dateOfIncidentOrProblem,
      'status': instance.status,
    };
