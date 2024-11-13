import '/config/all_imports.dart';

part 'complaint_data_response.g.dart';

@JsonSerializable()
class ComplaintDataResponse {
  @JsonKey(name: ApiKeys.detailOfComplaint)
  String? detailOfComplaint;

  @JsonKey(name: ApiKeys.dateOfIncidentOrProblem)
  String? dateOfIncidentOrProblem;

  @JsonKey(name: ApiKeys.status)
  bool? status;

  ComplaintDataResponse({
    required this.detailOfComplaint,
    required this.dateOfIncidentOrProblem,
    required this.status,
  });

  factory ComplaintDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplaintDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintDataResponseToJson(this);
}
