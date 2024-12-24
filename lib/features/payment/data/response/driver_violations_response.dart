import '/config/all_imports.dart';

part 'driver_violations_response.g.dart';

@JsonSerializable()
class DriverViolationsResponse {
  List<DriverViolationsDataResponse>? data;

  DriverViolationsResponse({
    required this.data,
  });

  factory DriverViolationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DriverViolationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DriverViolationsResponseToJson(this);
}
