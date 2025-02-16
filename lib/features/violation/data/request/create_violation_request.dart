class CreateViolationRequest {
  String? violationDate;
  String? violationAddress;
  String? vehicleNumber;
  String? vehicleType;
  String? vehicleColor;
  String? violationTime;
  int? reasonOfViolationId;
  String? ownerName;
  String? ownerIdNumber;
  String? driverIdNumber;

  CreateViolationRequest({
    required this.driverIdNumber,
    required this.violationAddress,
    required this.ownerName,
    required this.ownerIdNumber,
    required this.reasonOfViolationId,
    required this.vehicleColor,
    required this.vehicleNumber,
    required this.violationDate,
    required this.vehicleType,
    required this.violationTime,
  });
}
