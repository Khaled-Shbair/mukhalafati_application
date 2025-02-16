import '/config/all_imports.dart';

extension SearchForDriverMapper on SearchForDriverResponse {
  toDomain() {
    return SearchForDriverModel(
      licenseLevels: licenseLevels.onNull(),
      expiryDate: expiryDate.onNull(),
      idNumber: idNumber.onNull(),
      imageDriver: imageDriver.onNull(),
      licenseNumber: licenseNumber.onNull(),
      nameAr: nameAr.onNull(),
      nameEn: nameEn.onNull(),
      numberOfViolations: numberOfViolations.onNull(),
      releaseDate: releaseDate.onNull(),
      status: status.onNull(),
      message: message.onNull(),
    );
  }
}
