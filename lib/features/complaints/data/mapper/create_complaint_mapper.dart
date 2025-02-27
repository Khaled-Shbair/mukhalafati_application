import '/config/all_imports.dart';

extension CreateComplaintMapper on CreateComplaintResponse {
  toDomain() {
    return CreateComplaintModel(
      message: message.onNull(),
    );
  }
}
