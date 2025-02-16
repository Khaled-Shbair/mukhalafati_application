import '/config/all_imports.dart';

extension PoliceManForgotPasswordMapper on PoliceManForgotPasswordResponse {
  toDomain() {
    return PoliceManForgotPasswordModel(
      phoneNumber: phoneNumber.onNull(),
      policeManId: policeManId.onNull(),
    );
  }
}
