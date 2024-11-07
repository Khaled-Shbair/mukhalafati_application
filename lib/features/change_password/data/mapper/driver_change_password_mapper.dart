import '/config/all_imports.dart';

extension DriverChangePasswordMapper on DriverChangePasswordResponse {
  toDomain() {
    return DriverChangePasswordModel(message: message);
  }
}
