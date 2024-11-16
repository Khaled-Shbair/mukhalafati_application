import '/config/all_imports.dart';

extension ReasonOfViolationMapper on ReasonOfViolationResponse {
  toDomain() {
    return ReasonOfViolationModel(
      id: this.id.onNull(),
      price: price.onNull(),
      reason: reason.onNull(),
    );
  }
}
