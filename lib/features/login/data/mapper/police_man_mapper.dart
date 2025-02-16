import '/config/all_imports.dart';

extension PoliceManMapper on PoliceManLoginResponse {
  PoliceManLoginModel toDomain() {
    return PoliceManLoginModel(
      nameEn: nameEn.onNull(),
      nameAr: nameAr.onNull(),
      id: this.id.onNull(),
      image: image.onNull(),
      jobNumber: jobNumber.onNull(),
      militaryRank: militaryRank.onNull(),
      phoneNumber: phoneNumber.onNull(),
    );
  }
}
