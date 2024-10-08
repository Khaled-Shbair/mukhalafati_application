import '/config/all_imports.dart';

class DriverModel {
  late int driverId;
  late String driverImage;
  late String driverFirstNameEn;
  late String driverFirstNameAr;
  late String driverLastNameEn;
  late String driverLastNameAr;
  late String driverFatherNameAr;
  late String driverFatherNameEn;
  late String driverGrandfatherNameAr;
  late String driverGrandfatherNameEn;
  late String driverNameEn;
  late String phone;
  late String licenseNumber;
  late String driverIdNumber;
  late String releaseDate;
  late String expiryDate;
  late String licenseLevels;
  late int numberOfViolations;
  late int numberOfUnReadNotifications;

  DriverModel();

  DriverModel.fromMap(Map<String, dynamic> map) {
    driverId = map[DatabaseConstants.driverId];
    driverIdNumber = map[DatabaseConstants.driverIdNumber];
    driverImage = map[DatabaseConstants.driverImage];
    driverFirstNameEn = map[DatabaseConstants.driverFirstNameEn];
    driverFirstNameAr = map[DatabaseConstants.driverFirstNameAr];
    driverLastNameEn = map[DatabaseConstants.driverLastNameEn];
    driverLastNameAr = map[DatabaseConstants.driverLastNameAr];
    driverFatherNameAr = map[DatabaseConstants.driverFatherNameAr];
    driverFatherNameEn = map[DatabaseConstants.driverFatherNameEn];
    driverGrandfatherNameAr = map[DatabaseConstants.driverGrandFatherNameAr];
    driverGrandfatherNameEn = map[DatabaseConstants.driverGrandFatherNameEn];
    driverNameEn = map[DatabaseConstants.driverNameEn];
    phone = map[DatabaseConstants.phone];
    licenseNumber = map[DatabaseConstants.licenseNumber];
    releaseDate = map[DatabaseConstants.releaseDate];
    expiryDate = map[DatabaseConstants.expiryDate];
    licenseLevels = map[DatabaseConstants.licenseLevels];
    numberOfViolations = map[DatabaseConstants.numberOfViolations];
    numberOfUnReadNotifications =
        map[DatabaseConstants.numberOfUnReadNotifications];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseConstants.driverId: driverId,
      DatabaseConstants.driverIdNumber: driverIdNumber,
      DatabaseConstants.driverImage: driverImage,
      DatabaseConstants.driverFirstNameEn: driverFirstNameEn,
      DatabaseConstants.driverFirstNameAr: driverFirstNameAr,
      DatabaseConstants.driverLastNameEn: driverLastNameEn,
      DatabaseConstants.driverLastNameAr: driverLastNameAr,
      DatabaseConstants.driverFatherNameAr: driverFatherNameAr,
      DatabaseConstants.driverFatherNameEn: driverFatherNameEn,
      DatabaseConstants.driverGrandFatherNameAr: driverGrandfatherNameAr,
      DatabaseConstants.driverGrandFatherNameEn: driverGrandfatherNameEn,
      DatabaseConstants.driverNameEn: driverNameEn,
      DatabaseConstants.phone: phone,
      DatabaseConstants.licenseNumber: licenseNumber,
      DatabaseConstants.releaseDate: releaseDate,
      DatabaseConstants.expiryDate: expiryDate,
      DatabaseConstants.licenseLevels: licenseLevels,
      DatabaseConstants.numberOfViolations: numberOfViolations,
      DatabaseConstants.numberOfUnReadNotifications:
          numberOfUnReadNotifications,
    };
  }
}
