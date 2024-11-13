import '/config/all_imports.dart';

extension DriverLoginMapper on DriverLoginResponse {
  toDomain() {
    return DriverLoginModel(
      firstNameAr: firstNameAr.onNull(),
      firstNameEn: firstNameEn.onNull(),
      fatherNameAr: fatherNameAr.onNull(),
      fatherNameEn: fatherNameEn.onNull(),
      grandFatherNameAr: grandFatherNameAr.onNull(),
      grandFatherNameEn: grandFatherNameEn.onNull(),
      lastNameAr: lastNameAr.onNull(),
      lastNameEn: lastNameEn.onNull(),
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
