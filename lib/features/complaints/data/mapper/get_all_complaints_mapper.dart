import '/config/all_imports.dart';

extension GetAllComplaintsMapper on GetAllComplaintsForDriverResponse {
  toDomain() {
    return GetAllComplaintsModel(
      data: data?.map<ComplaintDataModel>((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension ComplaintDataMapper on ComplaintDataResponse {
  toDomain() {
    return ComplaintDataModel(
      status: status.onNull(),
      detailOfComplaint: detailOfComplaint.onNull(),
      dateOfIncidentOrProblem: dateOfIncidentOrProblem.onNull(),
    );
  }
}
