class SearchForDriverModel {
final String licenseNumber;
final String expiryDate;
final String releaseDate;
final String idNumber;
final String nameAr;
final String nameEn;
final String licenseLevels;
final String imageDriver;
final int numberOfViolations;
final String message;
final bool status;

  SearchForDriverModel({
    required this.licenseNumber,
    required this.status,
    required this.message,
    required this.idNumber,
    required this.expiryDate,
    required this.licenseLevels,
    required this.releaseDate,
    required this.imageDriver,
    required this.nameAr,
    required this.nameEn,
    required this.numberOfViolations,
  });
}
