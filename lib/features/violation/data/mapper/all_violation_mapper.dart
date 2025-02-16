import '/config/all_imports.dart';

extension AllViolationMapper on AllViolationResponse {
  toDomain() {
    return AllViolationModel(
      data: data.map<ViolationModel>((e) => e.toDomain()).toList(),
    );
  }
}

extension ViolationMapper on ViolationResponse {
  toDomain() {
    return ViolationModel(
      violationAddress: violationAddress.onNull(),
      violationDate: violationDate.onNull(),
      id: this.id.onNull(),
      driverName: driverName.onNull(),
    );
  }
}
