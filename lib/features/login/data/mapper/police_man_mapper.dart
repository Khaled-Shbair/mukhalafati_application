import '/config/all_imports.dart';

extension PoliceManMapper on PoliceManLoginResponse {
  PoliceManLoginModel toDomain() {
    return PoliceManLoginModel(
      fatherNameAr: fatherNameAr.onNull(),
      firstNameAr: firstNameAr.onNull(),
      grandFatherNameAr: grandFatherNameAr.onNull(),
      id: this.id.onNull(),
      image: image.onNull(),
      jobNumber: jobNumber.onNull(),
      lastNameAr: lastNameAr.onNull(),
      militaryRank: militaryRank.onNull(),
      phoneNumber: phoneNumber.onNull(),
    );
  }
}
