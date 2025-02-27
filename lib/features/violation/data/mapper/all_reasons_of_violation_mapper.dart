import '/config/all_imports.dart';

extension AllReasonsOfViolationMapper on AllReasonsOfViolationResponse {
  toDomain() {
    return AllReasonsOfViolationModel(
      data: data!.map<ReasonOfViolationModel>((e) => e.toDomain()).toList(),
    );
  }
}

extension ReasonOfViolationMapper on ReasonOfViolationResponse {
  toDomain() {
    return ReasonOfViolationModel(
      id: this.id.onNull(),
      price: price.onNull(),
      reason: reason.onNull(),
    );
  }
}
