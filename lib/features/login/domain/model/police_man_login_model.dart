class PoliceManLoginModel {
  final int id;
  final String image;
  final String nameAr;
  final String nameEn;
  final String phoneNumber;
  final String jobNumber;
  final String militaryRank;

  PoliceManLoginModel({
    required this.id,
    required this.militaryRank,
    required this.jobNumber,
    required this.image,
    required this.nameAr,
    required this.nameEn,
    required this.phoneNumber,
  });
}
