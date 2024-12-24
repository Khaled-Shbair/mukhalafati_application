class SendRequestUpdateProfileRequest {
  final int driverId;
  final String name;
  final String idNumber;
  final String phoneNumber;
  final String licenseNumber;

  SendRequestUpdateProfileRequest({
    required this.phoneNumber,
    required this.idNumber,
    required this.driverId,
    required this.name,
    required this.licenseNumber,
  });
}
