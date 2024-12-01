import '/config/all_imports.dart';

part 'list_of_violations_for_police_response.g.dart';

@JsonSerializable()
class ListOfViolationsForPoliceResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;

  ListOfViolationsForPoliceResponse({
    required this.message,
  });

  factory ListOfViolationsForPoliceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOfViolationsForPoliceResponseFromJson(json);

  Map<String, dynamic> toJson(ListOfViolationsForPoliceResponse instance) =>
      _$ListOfViolationsForPoliceResponseToJson(this);
}
