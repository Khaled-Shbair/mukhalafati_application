class CreateViolationModel {
  final String message;
  final bool status;
  final String fcmToken;
  final int driverId;

  CreateViolationModel({
    required this.driverId,
    required this.message,
    required this.status,
    required this.fcmToken,
  });
}
