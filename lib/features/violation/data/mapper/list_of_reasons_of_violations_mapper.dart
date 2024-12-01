import '/config/all_imports.dart';

extension ListOfReasonsOfViolationsMapper on ListOfReasonsOfViolationsResponse {
  toDomain() {
    return ListOfReasonsOfViolationsModel(
      data: data!.map<ReasonOfViolationModel>((e) => e.toDomain()).toList(),
    );
  }
}
