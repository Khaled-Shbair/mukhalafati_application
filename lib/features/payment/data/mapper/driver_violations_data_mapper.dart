import '/config/all_imports.dart';

extension DriverViolationsDataMapper on DriverViolationsDataResponse {
  toDomain() {
    return DriverViolationsDataModel(
      id: this.id.onNull(),
      priceOfViolation: priceOfViolation.onNull(),
      violationAddress: violationAddress.onNull(),
      violationDate: violationDate.onNull(),
      violationReason: violationReason.onNull(),
      violationState: violationState.onNull(),
      violationTime: violationTime.onNull(),
    );
  }
}
