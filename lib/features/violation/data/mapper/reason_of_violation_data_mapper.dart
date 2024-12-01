import '/config/all_imports.dart';

extension ReasonOfViolationDataMapper on ReasonOfViolationResponse {
  toDomain() {
    return ReasonOfViolationModel(
      id: this.id.onNull(),
      price: price.onNull(),
      reason: reason.onNull(),
    );
  }
}
