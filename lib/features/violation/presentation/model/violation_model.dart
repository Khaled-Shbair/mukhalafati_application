import '/config/all_imports.dart';

class ViolationModel {
  late int violationId;
  late int driverId;
  late int policeId;
  late String violationDate;
  late String violationTime;
  late int priceOfViolation;
  late int violationState;
  late String violationReason;
  late String violationAddress;
  String? violationPayedBy;

  ViolationModel();

  ViolationModel.fromMap(Map<String, dynamic> map) {
    violationId = map[DatabaseConstants.violationId];
    violationDate = map[DatabaseConstants.violationDate];
    violationTime = map[DatabaseConstants.violationTime];
    priceOfViolation = map[DatabaseConstants.priceOfViolation];
    violationState = map[DatabaseConstants.violationState];
    violationReason = map[DatabaseConstants.violationReason];
    violationAddress = map[DatabaseConstants.violationAddress];
    violationPayedBy = map[DatabaseConstants.violationPayedBy];
    driverId = map[DatabaseConstants.driverId];
    policeId = map[DatabaseConstants.policeId];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseConstants.violationDate: violationDate,
      DatabaseConstants.violationTime: violationTime,
      DatabaseConstants.priceOfViolation: priceOfViolation,
      DatabaseConstants.violationState: violationState,
      DatabaseConstants.violationReason: violationReason,
      DatabaseConstants.violationAddress: violationAddress,
      DatabaseConstants.violationPayedBy: violationPayedBy,
      DatabaseConstants.driverId: driverId,
      DatabaseConstants.policeId: policeId,
    };
  }
}
