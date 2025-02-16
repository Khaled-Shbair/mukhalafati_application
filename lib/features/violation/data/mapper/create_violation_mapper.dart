import '/config/all_imports.dart';

extension CreateViolationMapper on CreateViolationResponse {
  toDomain() {
    return CreateViolationModel(
      message: message.onNull(),
      driverId: driverId.onNull(),
      status: status.onNull(),
      fcmToken: fcmToken.onNull(),
    );
  }
}
