import '/config/all_imports.dart';

extension PoliceManMapper on PoliceManLoginResponse {
  PoliceManLoginModel toDomain() {
    return PoliceManLoginModel(
      fatherNameAr: fatherNameAr,
      firstNameAr: firstNameAr,
      grandFatherNameAr: grandFatherNameAr,
      id: this.id,
      image: image,
      jobNumber: jobNumber,
      lastNameAr: lastNameAr,
      militaryRank: militaryRank,
      phoneNumber: phoneNumber,
    );
  }
}
