import '/config/all_imports.dart';

extension ReasonOfViolationDataMapper on ReasonOfViolationDataResponse {
  toDomain() {
    return ReasonOfViolationDataModel(
      id: this.id.onNull(),
      price: price.onNull(),
      reason: reason.onNull(),
    );
  }
}
