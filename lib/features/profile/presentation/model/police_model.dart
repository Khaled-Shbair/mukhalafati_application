import '/config/all_imports.dart';

class PoliceModel {
  late int policeId;
  late String policeFirstNameAr;
  late String policeLastNameAr;
  late String policeFatherNameAr;
  late String policeGrandfatherNameAr;
  late String policeImage;
  late String policePassword;
  late String policeMilitaryRank;
  late String policePhoneNumber;
  late int policeJobNumber;

  PoliceModel();

  PoliceModel.fromMap(Map<String, dynamic> map) {
    policeId = map[DatabaseConstants.policeId];
    policeFirstNameAr = map[DatabaseConstants.policeFirstNameAr];
    policeLastNameAr = map[DatabaseConstants.policeLastNameAr];
    policeFatherNameAr = map[DatabaseConstants.policeFatherNameAr];
    policeGrandfatherNameAr = map[DatabaseConstants.policeGrandfatherNameAr];
    policePhoneNumber = map[DatabaseConstants.policePhoneNumber];
    policeImage = map[DatabaseConstants.policeImage];
    policePassword = map[DatabaseConstants.policePassword];
    policeMilitaryRank = map[DatabaseConstants.policeMilitaryRank];
    policeJobNumber = map[DatabaseConstants.policeJobNumber];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseConstants.policeId: policeId,
      DatabaseConstants.policeFirstNameAr: policeFirstNameAr,
      DatabaseConstants.policeLastNameAr: policeLastNameAr,
      DatabaseConstants.policeFatherNameAr: policeFatherNameAr,
      DatabaseConstants.policeGrandfatherNameAr: policeGrandfatherNameAr,
      DatabaseConstants.policeImage: policeImage,
      DatabaseConstants.policePassword: policePassword,
      DatabaseConstants.policeMilitaryRank: policeMilitaryRank,
      DatabaseConstants.policeJobNumber: policeJobNumber,
      DatabaseConstants.policePhoneNumber: policePhoneNumber,
    };
  }
}
