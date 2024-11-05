import '/config/all_imports.dart';

extension DriverLoginMapper on DriverLoginResponse {
  toDomain() {
    return DriverLoginModel(
      firstNameAr: firstNameAr,
      firstNameEn: firstNameEn,
      fatherNameAr: fatherNameAr,
      fatherNameEn: fatherNameEn,
      grandFatherNameAr: grandFatherNameAr,
      grandFatherNameEn: grandFatherNameEn,
      lastNameAr: lastNameAr,
      lastNameEn: lastNameEn,
      licenseNumber: licenseNumber,
      id: this.id,
      idNumber: idNumber,
      image: image,
      expiryDate: expiryDate,
      licenseLevels: licenseLevels,
      numberOfUnReadNotifications: numberOfUnReadNotifications,
      numberOfViolationsPaid: numberOfViolationsPaid,
      numberOfViolationsUnPaid: numberOfViolationsUnPaid,
      phone: phoneNumber,
      releaseDate: releaseDate,
    );
  }
}
