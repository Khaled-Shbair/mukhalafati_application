import '/config/all_imports.dart';

extension PoliceManChangePasswordMapper on PoliceManChangePasswordResponse {
  toDomain() {
    return PoliceManChangePasswordModel(
      message: message.onNull(),
    );
  }
}
