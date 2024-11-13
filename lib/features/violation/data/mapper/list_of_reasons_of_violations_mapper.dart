import '/config/all_imports.dart';

extension ListOfReasonsOfViolationsMapper on ListOfReasonsOfViolationsResponse {
  toDomain() {
    return ListOfReasonsOfViolationsModel(
      data: data!.map<ReasonOfViolationDataModel>((e) => e.toDomain()).toList(),
    );
  }
}
