import '/config/all_imports.dart';

extension PoliceManForgotPasswordMapper on PoliceManForgotPasswordResponse {
  toDomain() {
    return PoliceManForgotPasswordModel(
      phoneNumber: phoneNumber,
      policeManId: policeManId,
    );
  }
}
