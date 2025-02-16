import '/config/all_imports.dart';

extension DriverViolationsMapper on DriverViolationsResponse {
  toDomain() {
    return DriverViolationsModel(
        data: data
                ?.map<DriverViolationsDataModel>((e) => e.toDomain())
                .toList() ??
            []);
  }
}

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
