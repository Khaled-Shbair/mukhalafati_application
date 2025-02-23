import '/config/all_imports.dart';

extension HomeDriverMapper on HomeDriverDataResponse {
  toDomain() {
    final sharedPref = instance<SharedPreferencesController>();
    return HomeDriverModel(
      image: image != null &&
              sharedPref.getString(SharedPreferencesKeys.image) != image
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.image, image);
              return image.onNull();
            })()
          : image.onNull(),
      id: this.id != null &&
              sharedPref.getInt(SharedPreferencesKeys.userId) != this.id
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.userId, id);
              return this.id.onNull();
            })()
          : this.id.onNull(),
      nameEn: nameEn != null &&
              sharedPref.getString(SharedPreferencesKeys.nameEn) != nameEn
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.nameEn, nameEn);
              return nameEn.onNull();
            })()
          : nameEn.onNull(),
      nameAr: nameAr != null &&
              sharedPref.getString(SharedPreferencesKeys.nameAr) != nameAr
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.nameAr, nameAr);
              return nameAr.onNull();
            })()
          : nameAr.onNull(),
      licenseNumber: licenseNumber != null &&
              sharedPref.getString(SharedPreferencesKeys.licenseOrJobNumber) !=
                  licenseNumber
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.licenseOrJobNumber, licenseNumber);
              return licenseNumber.onNull();
            })()
          : licenseNumber.onNull(),
      idNumber: idNumber != null &&
              sharedPref.getString(SharedPreferencesKeys.idNumber) != idNumber
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.idNumber, idNumber);
              return idNumber.onNull();
            })()
          : idNumber.onNull(),
      expiryDate: expiryDate != null &&
              sharedPref.getString(SharedPreferencesKeys.expiryDateLicense) !=
                  expiryDate
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.expiryDateLicense, expiryDate);
              return expiryDate.onNull();
            })()
          : expiryDate.onNull(),
      licenseLevels: licenseLevels != null &&
              sharedPref.getString(
                      SharedPreferencesKeys.licenseLevelsOfLicense) !=
                  licenseLevels
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.licenseLevelsOfLicense, licenseLevels);
              return licenseLevels.onNull();
            })()
          : licenseLevels.onNull(),
      phone: phoneNumber != null &&
              sharedPref.getString(SharedPreferencesKeys.phoneNumber) !=
                  phoneNumber
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.phoneNumber, phoneNumber);
              return phoneNumber.onNull();
            })()
          : phoneNumber.onNull(),
      numberOfViolationsUnPaid: numberOfViolationsUnPaid != null &&
              sharedPref
                      .getInt(SharedPreferencesKeys.numberOfViolationsUnPaid) !=
                  numberOfViolationsUnPaid
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.numberOfViolationsUnPaid,
                  numberOfViolationsUnPaid);
              return numberOfViolationsUnPaid.onNull();
            })()
          : numberOfViolationsUnPaid.onNull(),
      numberOfViolationsPaid: numberOfViolationsPaid != null &&
              sharedPref.getInt(SharedPreferencesKeys.numberOfViolationsPaid) !=
                  numberOfViolationsPaid
          ? (() {
              sharedPref.setData(SharedPreferencesKeys.numberOfViolationsPaid,
                  numberOfViolationsPaid);
              return numberOfViolationsPaid.onNull();
            })()
          : numberOfViolationsPaid.onNull(),
      numberOfUnReadNotifications: numberOfUnReadNotifications != null &&
              sharedPref.getInt(
                      SharedPreferencesKeys.numberOfUnReadNotifications) !=
                  numberOfUnReadNotifications
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.numberOfUnReadNotifications,
                  numberOfUnReadNotifications);
              return numberOfUnReadNotifications.onNull();
            })()
          : numberOfUnReadNotifications.onNull(),
      releaseDate: releaseDate != null &&
              sharedPref.getString(SharedPreferencesKeys.releaseDateLicense) !=
                  releaseDate
          ? (() {
              sharedPref.setData(
                  SharedPreferencesKeys.releaseDateLicense, releaseDate);
              return releaseDate.onNull();
            })()
          : releaseDate.onNull(),
    );
  }
}
