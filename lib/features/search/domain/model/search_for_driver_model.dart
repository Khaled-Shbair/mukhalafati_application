class SearchForDriverModel {
  String licenseNumber;
  String expiryDate;
  String releaseDate;
  String idNumber;
  String nameAr;
  String nameEn;
  String licenseLevels;
  String imageDriver;
  int numberOfViolations;

  SearchForDriverModel({
    required this.licenseNumber,
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
