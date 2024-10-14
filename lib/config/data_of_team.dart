import 'all_imports.dart';

void createSajaAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel saja = DriverModel();
  saja.driverIdNumber = '407811730';
  saja.password = '0000';
  saja.driverImage = ManagerAssets.saja;
  saja.licenseNumber = '96578423';
  saja.licenseLevels = '[2 3 B]';
  saja.expiryDate = '28-9-2028';
  saja.releaseDate = '25-9-2023';
  saja.phone = '0592638012';
  saja.driverFirstNameEn = 'Saja';
  saja.driverFirstNameAr = 'سجي';
  saja.driverFatherNameAr = 'فايق';
  saja.driverGrandfatherNameAr = 'شكري';
  saja.driverFatherNameEn = 'F.';
  saja.driverGrandfatherNameEn = 'S.';
  saja.driverLastNameAr = 'الأشرم';
  saja.driverNameEn = 'Saja F.S. AlAshram';
  saja.driverLastNameEn = 'ALAshram';
  saja.numberOfUnReadNotifications = 3;
  await driverDatabase.create(saja);
}

void createMalakAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel malak = DriverModel();
  malak.driverIdNumber = '407811731';
  malak.password = '0000';

  malak.driverImage = ManagerAssets.malak;
  malak.licenseNumber = '96578450';
  malak.licenseLevels = '[2 1 B]';
  malak.expiryDate = '28-9-2028';
  malak.releaseDate = '25-9-2023';
  malak.phone = '0599634666';
  malak.driverFirstNameEn = 'Malak';
  malak.driverFirstNameAr = 'ملك';
  malak.driverFatherNameAr = 'عبدالحليم';
  malak.driverGrandfatherNameAr = 'عبدالفتاح';
  malak.driverFatherNameEn = 'A.';
  malak.driverGrandfatherNameEn = 'A.';
  malak.driverLastNameAr = 'مسعود';
  malak.driverNameEn = 'Malak A.A. Massoud';
  malak.driverLastNameEn = 'Massoud';
  malak.numberOfUnReadNotifications = 6;
  await driverDatabase.create(malak);
}

void createGeneenAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel geneen = DriverModel();
  geneen.driverIdNumber = '407811736';
  geneen.password = '0000';
  geneen.driverImage = ManagerAssets.geneen;
  geneen.licenseNumber = '96578426';
  geneen.licenseLevels = '[2 3 B]';
  geneen.expiryDate = '28-9-2028';
  geneen.releaseDate = '25-9-2023';
  geneen.phone = '0593682964';
  geneen.driverFirstNameEn = 'Geneen';
  geneen.driverFirstNameAr = 'جنين';
  geneen.driverFatherNameAr = 'محمد';
  geneen.driverGrandfatherNameAr = 'محمد';
  geneen.driverFatherNameEn = 'M.';
  geneen.driverGrandfatherNameEn = 'M.';
  geneen.driverLastNameAr = 'الجليس';
  geneen.driverNameEn = 'Geneen M.M. Aljalees';
  geneen.driverLastNameEn = 'Aljalees';
  geneen.numberOfUnReadNotifications = 1;
  await driverDatabase.create(geneen);
}

void createShahedAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel shahed = DriverModel();
  shahed.driverIdNumber = '407811739';
  shahed.driverImage = ManagerAssets.shahed;
  shahed.licenseNumber = '96578443';
  shahed.password = '0000';
  shahed.licenseLevels = '[1 4 A]';
  shahed.expiryDate = '28-9-2028';
  shahed.releaseDate = '25-9-2023';
  shahed.phone = '0595329830';
  shahed.driverFirstNameEn = 'Shahed';
  shahed.driverFirstNameAr = 'سجي';
  shahed.driverFatherNameAr = 'أحمد';
  shahed.driverGrandfatherNameAr = 'أحمد';
  shahed.driverFatherNameEn = 'A.';
  shahed.driverGrandfatherNameEn = 'A.';
  shahed.driverLastNameAr = 'شكوكاني';
  shahed.driverNameEn = 'Shahed A.A. Shkokani';
  shahed.driverLastNameEn = 'Shkokani';
  shahed.numberOfUnReadNotifications = 9;
  await driverDatabase.create(shahed);
}

void createPoliceAccount() async {
  PoliceDatabaseController policeDatabase =
      instance<PoliceDatabaseController>();
  PoliceModel police = PoliceModel();
  police.policeJobNumber = '12345678';
  police.policeImage = ManagerAssets.policeImage;
  police.policeMilitaryRank = 'رائد';
  police.policeFirstNameAr = 'خالد';
  police.policeLastNameAr = 'شبير';
  police.policePassword = '123456';
  police.policePhoneNumber = '0599724037';
  police.policeFatherNameAr = 'عبد المنعم';
  police.policeGrandfatherNameAr = 'عثمان';
  await policeDatabase.create(police);
}
