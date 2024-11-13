class CreateViolationRequest {
  String? driverIdNumber;
  double? priceOfViolation;
  int? policeManId;
  String? driverName;
  String? ownerName;
  String? ownerId;
  String? vehicleNumber;
  String? vehicleType;
  String? vehicleColor;
  String? violationTime;
  String? violationDate;
  String? violationReason;
  String? violationAddress;
  String? reasonForViolation;

  CreateViolationRequest({
    required this.driverIdNumber,
    required this.priceOfViolation,
    required this.violationAddress,
    required this.driverName,
    required this.ownerName,
    required this.ownerId,
    required this.violationReason,
    required this.reasonForViolation,
    required this.vehicleColor,
    required this.vehicleNumber,
    required this.violationDate,
    required this.vehicleType,
    required this.violationTime,
  });
}
