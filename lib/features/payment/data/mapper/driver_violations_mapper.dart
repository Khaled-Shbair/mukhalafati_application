import '/config/all_imports.dart';

extension DriverViolationsMapper on DriverViolationsResponse {
  toDomain() {
    return DriverViolationsModel(
        data:
            data!.map<DriverViolationsDataModel>((e) => e.toDomain()).toList());
  }
}
