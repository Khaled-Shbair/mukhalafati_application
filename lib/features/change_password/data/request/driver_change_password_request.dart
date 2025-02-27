class DriverChangePasswordRequest {
  int? driverId;
  String? newPassword;
  String? confirmPassword;

  DriverChangePasswordRequest({
    required this.driverId,
    required this.confirmPassword,
    required this.newPassword,
  });
}
