import '/config/all_imports.dart';

extension GetViolationDetailsMapper on GetViolationDetailsResponse {
  toDomain() {
    return GetViolationDetailsModel(
      id: this.id.onNull(),
      driverName: driverName.onNull(),
      ownerName: ownerName.onNull(),
      ownerIdNumber: ownerIdNumber.onNull(),
      policeName: policeName.onNull(),
      violationDate: violationDate.onNull(),
      violationTime: violationTime.onNull(),
      driverIdNumber: driverIdNumber.onNull(),
      violationReason: violationReason.onNull(),
      violationAddress: violationAddress.onNull(),
      vehicleColor: vehicleColor.onNull(),
      vehicleNumber: vehicleNumber.onNull(),
      vehicleType: vehicleType.onNull(),
    );
  }
}
