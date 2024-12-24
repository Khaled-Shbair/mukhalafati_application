import '/config/all_imports.dart';

part 'list_of_reasons_of_violations_response.g.dart';

@JsonSerializable()
class ListOfReasonsOfViolationsResponse {
  @JsonKey(name: ApiKeys.data)
  List<ReasonOfViolationResponse>? data;

  ListOfReasonsOfViolationsResponse({
    required this.data,
  });

  factory ListOfReasonsOfViolationsResponse.fromJson(
      Map<String, dynamic> json) =>
      _$ListOfReasonsOfViolationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListOfReasonsOfViolationsResponseToJson(this);
}
