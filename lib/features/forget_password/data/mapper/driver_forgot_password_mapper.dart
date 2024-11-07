import '/config/all_imports.dart';

extension DriverForgotPasswordMapper on DriverForgotPasswordResponse {
  toDomain() {
    return DriverForgotPasswordModel(
      phoneNumber: phoneNumber,
      driverId: driverId,
    );
  }
}
