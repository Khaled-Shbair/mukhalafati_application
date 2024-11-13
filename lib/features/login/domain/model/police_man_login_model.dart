class PoliceManLoginModel {
  int id;
  String image;
  String firstNameAr;
  String lastNameAr;
  String fatherNameAr;
  String grandFatherNameAr;
  String phoneNumber;
  String jobNumber;
  String militaryRank;

  PoliceManLoginModel({
    required this.id,
    required this.militaryRank,
    required this.jobNumber,
    required this.image,
    required this.lastNameAr,
    required this.grandFatherNameAr,
    required this.fatherNameAr,
    required this.firstNameAr,
    required this.phoneNumber,
  });
}
