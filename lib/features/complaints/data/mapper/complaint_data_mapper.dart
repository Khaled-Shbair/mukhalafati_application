import '/config/all_imports.dart';

extension ComplaintDataMapper on ComplaintDataResponse {
  toDomain() {
    return ComplaintDataModel(
      status: status.onNull(),
      detailOfComplaint: detailOfComplaint.onNull(),
      dateOfIncidentOrProblem: dateOfIncidentOrProblem.onNull(),
    );
  }
}
