class DriverLoginModel {
  int id;
  String image;
  String firstNameEn;
  String firstNameAr;
  String fatherNameAr;
  String fatherNameEn;
  String lastNameEn;
  String lastNameAr;
  String grandFatherNameAr;
  String grandFatherNameEn;
  String phone;
  String licenseNumber;
  String releaseDate;
  String expiryDate;
  String licenseLevels;
  String idNumber;
  int numberOfViolationsUnPaid;
  int numberOfViolationsPaid;
  int numberOfUnReadNotifications;

  DriverLoginModel({
    required this.licenseNumber,
    required this.releaseDate,
    required this.numberOfUnReadNotifications,
    required this.licenseLevels,
    required this.expiryDate,
    required this.firstNameAr,
    required this.fatherNameAr,
    required this.grandFatherNameAr,
    required this.idNumber,
    required this.lastNameAr,
    required this.image,
    required this.id,
    required this.grandFatherNameEn,
    required this.fatherNameEn,
    required this.numberOfViolationsUnPaid,
    required this.firstNameEn,
    required this.numberOfViolationsPaid,
    required this.lastNameEn,
    required this.phone,
  });
}
