import '/config/all_imports.dart';

extension DriverLoginMapper on DriverLoginResponse {
  toDomain() {
    return DriverLoginModel(
      nameAr: nameAr.onNull(),
      nameEn:FormatNameHelper. fullNameEn(nameEn.onNull()),
      licenseNumber: licenseNumber.onNull(),
      id: this.id.onNull(),
      idNumber: idNumber.onNull(),
      image: image.onNull(),
      expiryDate: expiryDate.onNull(),
      licenseLevels: licenseLevels.onNull(),
      numberOfUnReadNotifications: numberOfUnReadNotifications.onNull(),
      numberOfViolationsPaid: numberOfViolationsPaid.onNull(),
      numberOfViolationsUnPaid: numberOfViolationsUnPaid.onNull(),
      phone: phoneNumber.onNull(),
      releaseDate: releaseDate.onNull(),
    );
  }
}
