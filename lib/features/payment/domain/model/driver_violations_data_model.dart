class DriverViolationsDataModel {
  int id;
  String violationDate;
  String violationTime;
  bool violationState;
  String violationAddress;
  String violationReason;
  num priceOfViolation;

  DriverViolationsDataModel({
    required this.id,
    required this.violationState,
    required this.violationAddress,
    required this.violationTime,
    required this.violationDate,
    required this.violationReason,
    required this.priceOfViolation,
  });
}
