import '/config/all_imports.dart';

part 'create_violation_response.g.dart';

@JsonSerializable()
class CreateViolationResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;

  CreateViolationResponse({
    required this.message,
  });

  factory CreateViolationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateViolationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateViolationResponseToJson(this);
}
