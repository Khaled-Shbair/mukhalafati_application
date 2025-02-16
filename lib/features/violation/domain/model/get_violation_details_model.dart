class GetViolationDetailsModel {
  final int id;
  final String ownerName;
  final String ownerIdNumber;
  final String driverName;
  final String policeName;
  final String violationDate;
  final String violationTime;
  final String driverIdNumber;
  final String violationReason;
  final String violationAddress;
  final String vehicleColor;
  final String vehicleType;
  final String vehicleNumber;

  GetViolationDetailsModel({
    required this.vehicleColor,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.violationAddress,
    required this.violationReason,
    required this.driverIdNumber,
    required this.violationTime,
    required this.violationDate,
    required this.policeName,
    required this.driverName,
    required this.ownerIdNumber,
    required this.ownerName,
    required this.id,
  });
}
