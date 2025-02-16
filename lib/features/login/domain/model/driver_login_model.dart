class DriverLoginModel {
  final int id;
  final String image;
  final String nameEn;
  final String nameAr;
  final String phone;
  final String licenseNumber;
  final String releaseDate;
  final String expiryDate;
  final String licenseLevels;
  final String idNumber;
  final int numberOfViolationsUnPaid;
  final int numberOfViolationsPaid;
  final int numberOfUnReadNotifications;

  DriverLoginModel({
    required this.licenseNumber,
    required this.releaseDate,
    required this.numberOfUnReadNotifications,
    required this.licenseLevels,
    required this.expiryDate,
    required this.nameEn,
    required this.nameAr,
    required this.idNumber,
    required this.image,
    required this.id,
    required this.numberOfViolationsUnPaid,
    required this.numberOfViolationsPaid,
    required this.phone,
  });
}
