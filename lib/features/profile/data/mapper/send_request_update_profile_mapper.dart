import '/config/all_imports.dart';

extension SendRequestUpdateProfileMapper on SendRequestUpdateProfileResponse {
  toDomain() {
    return SendRequestUpdateProfileModel(
      message: message.onNull(),
      status: status.onNull(),
    );
  }
}
