import '/config/all_imports.dart';

part 'get_all_complaints_for_driver_response.g.dart';

@JsonSerializable()
class GetAllComplaintsForDriverResponse {
  @JsonKey(name: ApiKeys.data)
  List<ComplaintDataResponse>? data;

  GetAllComplaintsForDriverResponse({
    required this.data,
  });

  factory GetAllComplaintsForDriverResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllComplaintsForDriverResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllComplaintsForDriverResponseToJson(this);
}

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
