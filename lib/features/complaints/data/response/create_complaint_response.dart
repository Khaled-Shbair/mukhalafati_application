import '/config/all_imports.dart';

part 'create_complaint_response.g.dart';

@JsonSerializable()
class CreateComplaintResponse {
  @JsonKey(name: ApiKeys.message)
  String? message;

  CreateComplaintResponse({
    required this.message,
  });

  factory CreateComplaintResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateComplaintResponseFromJson(json);

  Map<String, dynamic> toJson(CreateComplaintResponse instance) =>
      _$CreateComplaintResponseToJson(this);
}
