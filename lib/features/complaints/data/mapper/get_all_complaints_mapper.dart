import '/config/all_imports.dart';

extension GetAllComplaintsMapper on GetAllComplaintsForDriverResponse {
  toDomain() {
    return GetAllComplaintsModel(
      data: data!.map<ComplaintDataModel>((e) => e.toDomain()).toList(),
    );
  }
}
