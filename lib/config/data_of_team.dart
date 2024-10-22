import 'all_imports.dart';

void createDoctorAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel doctor = DriverModel();
  doctor.driverIdNumber = '968892830';
  doctor.driverVerificationCode = 2222;
  doctor.password = '0000';
  doctor.driverImage = ManagerAssets.doctor;
  doctor.licenseNumber = '987654321';
  doctor.licenseLevels = '[2 3 B]';
  doctor.expiryDate = '28-9-2028';
  doctor.releaseDate = '25-9-2023';
  doctor.phone = '0595668801';
  doctor.driverFirstNameEn = 'Mohamed';
  doctor.driverFirstNameAr = 'محمد';
  doctor.driverFatherNameAr = 'زكي';
  doctor.driverGrandfatherNameAr = 'دهمان';
  doctor.driverLastNameAr = 'شبير';
  doctor.driverFatherNameEn = 'Z.';
  doctor.driverGrandfatherNameEn = 'D.';
  doctor.driverNameEn = 'Mohamed Z.D. Shbair';
  doctor.driverLastNameEn = 'Shbair';
  doctor.numberOfUnReadNotifications = 2;
  doctor.numberOfViolationsUnPaid = 1;
  doctor.numberOfViolationsPaid = 1;
  await driverDatabase.create(doctor);
}

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
  saja.numberOfUnReadNotifications = 2;
  saja.numberOfViolationsUnPaid = 1;
  saja.numberOfViolationsPaid = 1;
  saja.driverVerificationCode = 2222;
  await driverDatabase.create(saja);
}

void createMalakAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel malak = DriverModel();
  malak.driverIdNumber = '407811731';
  malak.password = '0000';

  malak.driverImage = ManagerAssets.malak;
  malak.numberOfViolationsUnPaid = 10;
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
  malak.numberOfUnReadNotifications = 2;
  malak.numberOfViolationsPaid = 1;
  malak.numberOfViolationsUnPaid = 1;
  malak.driverVerificationCode = 2222;
  await driverDatabase.create(malak);
}

void createGeneenAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel geneen = DriverModel();
  geneen.driverIdNumber = '407811736';
  geneen.password = '0000';
  geneen.numberOfViolationsUnPaid = 10;
  geneen.numberOfViolationsPaid = 7;
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
  geneen.numberOfUnReadNotifications = 2;
  geneen.numberOfViolationsPaid = 1;
  geneen.numberOfViolationsUnPaid = 1;
  geneen.driverVerificationCode = 2222;
  await driverDatabase.create(geneen);
}

void createShahedAccount() async {
  DriverDatabaseController driverDatabase =
      instance<DriverDatabaseController>();
  DriverModel shahed = DriverModel();
  shahed.driverVerificationCode = 2222;
  shahed.numberOfViolationsUnPaid = 10;
  shahed.numberOfViolationsPaid = 7;
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
  shahed.numberOfUnReadNotifications = 2;
  shahed.numberOfViolationsPaid = 1;
  shahed.numberOfViolationsUnPaid = 1;
  await driverDatabase.create(shahed);
}

void createPoliceAccount() async {
  PoliceDatabaseController policeDatabase =
      instance<PoliceDatabaseController>();
  PoliceModel police = PoliceModel();
  police.policeVerificationCode = 2222;
  police.policeJobNumber = '12345678';
  police.policeImage = ManagerAssets.policeImage;
  police.policeMilitaryRank = 'رائد';
  police.policeFirstNameAr = 'خالد';
  police.policeLastNameAr = 'شبير';
  police.policePassword = '123456';
  police.policePhoneNumber = '0599724037';
  police.policeFatherNameAr = 'عبد المنعم';
  police.policeGrandfatherNameAr = 'عثمان';
  int r = await policeDatabase.create(police);
  debugPrint('Police: $r');
}

void createTest() async {
  TestResultDatabaseController testResultDatabase =
      instance<TestResultDatabaseController>();
  TestResultModel test = TestResultModel();
  test.studentId = '12345678';
  test.studentName = 'خالد عبد المنعم عثمان شبير';
  test.licenseTestResults = 0;
  test.practicalTestResults = 1;
  int x = await testResultDatabase.create(test);
  debugPrint('Test Result: $x');
}

void createNotifications() async {
  NotificationsDatabaseController notificationsDatabase =
      instance<NotificationsDatabaseController>();
  NotificationModel notificationS1 = NotificationModel();
  notificationS1.driverId = 2;
  notificationS1.notificationText =
      'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات';
  notificationS1.notificationTime = 'ساعتين';
  await notificationsDatabase.create(notificationS1);
  NotificationModel notificationS2 = NotificationModel();
  notificationS2.driverId = 2;
  notificationS2.notificationText = 'لقد تم مخالفتك قبل قليل بسبب الوقوف في مكان ممنوع الوقوف فيه';
  notificationS2.notificationTime = 'ساعة';
  await notificationsDatabase.create(notificationS2);
  NotificationModel notificationSh1 = NotificationModel();
  notificationSh1.driverId = 5;
  notificationSh1.notificationText =
      'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات';
  notificationSh1.notificationTime = 'ساعتين';
  await notificationsDatabase.create(notificationSh1);
  NotificationModel notificationSh2 = NotificationModel();
  notificationSh2.driverId = 5;
  notificationSh2.notificationText =
      'لقد تم مخالفتك قبل قليل بسبب الوقوف في مكان ممنوع الوقوف فيه';
  notificationSh2.notificationTime = 'ساعة';
  await notificationsDatabase.create(notificationSh2);
  NotificationModel notificationD1 = NotificationModel();
  notificationD1.driverId = 1;
  notificationD1.notificationText =
      'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات';
  notificationD1.notificationTime = 'ساعتين';
  await notificationsDatabase.create(notificationD1);
  NotificationModel notificationD2 = NotificationModel();
  notificationD2.driverId = 1;
  notificationD2.notificationText =
      'لقد تم مخالفتك قبل قليل بسبب الوقوف في مكان ممنوع الوقوف فيه';
  notificationD2.notificationTime = 'ساعة';
  await notificationsDatabase.create(notificationD2);
  NotificationModel notificationM1 = NotificationModel();
  notificationM1.driverId = 3;
  notificationM1.notificationText =
      'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات';
  notificationM1.notificationTime = 'ساعتين';
  await notificationsDatabase.create(notificationM1);
  NotificationModel notificationM2 = NotificationModel();
  notificationM2.driverId = 3;
  notificationM2.notificationText =
      'لقد تم مخالفتك قبل قليل بسبب الوقوف في مكان ممنوع الوقوف فيه';
  notificationM2.notificationTime = 'ساعة';
  await notificationsDatabase.create(notificationM2);
  NotificationModel notificationG1 = NotificationModel();
  notificationG1.driverId = 4;
  notificationG1.notificationText =
      'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات';
  notificationG1.notificationTime = 'ساعتين';
  await notificationsDatabase.create(notificationG1);
  NotificationModel notificationG2 = NotificationModel();
  notificationG2.driverId = 4;
  notificationG2.notificationText =
      'لقد تم مخالفتك قبل قليل بسبب الوقوف في مكان ممنوع الوقوف فيه';
  notificationG2.notificationTime = 'ساعة';
  await notificationsDatabase.create(notificationG2);
}

void createViolations() async {
  ViolationsDatabaseController violationsDatabase =
      instance<ViolationsDatabaseController>();
  ViolationModel a = ViolationModel();
  a.violationDate = '17/9/2024';
  a.violationTime = '10:49:30 AM';
  a.priceOfViolation = 200;
  a.violationState = 0;
  a.violationReason = 'الوقوف في مكان ممنوع';
  a.violationAddress = 'خانيونس - البلد - شارع شبير';
  a.violationPayedBy = ManagerStrings.jawwalPay;
  a.driverId = 1;
  a.policeId = 12345678;
  await violationsDatabase.create(a);
  ViolationModel aa = ViolationModel();
  aa.violationDate = '17/9/2024';
  aa.violationTime = '2:49:30 PM';
  aa.priceOfViolation = 250;
  aa.violationState = 1;
  aa.violationReason = 'عدم وضع حزام الأمان';
  aa.violationAddress = 'خانيونس - دوار بني سهيلا';
  aa.driverId = 1;
  aa.policeId = 12345678;
  await violationsDatabase.create(aa);

  ViolationModel b = ViolationModel();
  b.violationDate = '17/9/2024';
  b.violationTime = '10:49:30 AM';
  b.priceOfViolation = 200;
  b.violationState = 0;
  b.violationReason = 'الوقوف في مكان ممنوع';
  b.violationAddress = 'خانيونس - البلد - شارع شبير';
  b.violationPayedBy = ManagerStrings.jawwalPay;
  b.driverId = 2;
  b.policeId = 12345678;
  await violationsDatabase.create(b);
  ViolationModel bb = ViolationModel();
  bb.violationDate = '17/9/2024';
  bb.violationTime = '2:49:30 PM';
  bb.priceOfViolation = 250;
  bb.violationState = 1;
  bb.violationReason = 'عدم وضع حزام الأمان';
  bb.violationAddress = 'خانيونس - دوار بني سهيلا';
  bb.driverId = 2;
  bb.policeId = 12345678;
  await violationsDatabase.create(bb);
  ViolationModel c = ViolationModel();
  c.violationDate = '17/9/2024';
  c.violationTime = '10:49:30 AM';
  c.priceOfViolation = 200;
  c.violationState = 0;
  c.violationReason = 'الوقوف في مكان ممنوع';
  c.violationAddress = 'خانيونس - البلد - شارع شبير';
  c.violationPayedBy = ManagerStrings.jawwalPay;
  c.driverId = 3;
  c.policeId = 12345678;
  await violationsDatabase.create(c);
  ViolationModel cc = ViolationModel();
  cc.violationDate = '17/9/2024';
  cc.violationTime = '2:49:30 PM';
  cc.priceOfViolation = 250;
  cc.violationState = 1;
  cc.violationReason = 'عدم وضع حزام الأمان';
  cc.violationAddress = 'خانيونس - دوار بني سهيلا';
  cc.driverId = 3;
  cc.policeId = 12345678;
  await violationsDatabase.create(cc);
  ViolationModel d = ViolationModel();
  d.violationDate = '17/9/2024';
  d.violationTime = '10:49:30 AM';
  d.priceOfViolation = 200;
  d.violationState = 0;
  d.violationReason = 'الوقوف في مكان ممنوع';
  d.violationAddress = 'خانيونس - البلد - شارع شبير';
  d.violationPayedBy = ManagerStrings.jawwalPay;
  d.driverId = 4;
  d.policeId = 12345678;
  await violationsDatabase.create(d);
  ViolationModel dd = ViolationModel();
  dd.violationDate = '17/9/2024';
  dd.violationTime = '2:49:30 PM';
  dd.priceOfViolation = 250;
  dd.violationState = 1;
  dd.violationReason = 'عدم وضع حزام الأمان';
  dd.violationAddress = 'خانيونس - دوار بني سهيلا';
  dd.driverId = 4;
  dd.policeId = 12345678;
  await violationsDatabase.create(dd);
  ViolationModel e = ViolationModel();
  e.violationDate = '17/9/2024';
  e.violationTime = '10:49:30 AM';
  e.priceOfViolation = 200;
  e.violationState = 0;
  e.violationReason = 'الوقوف في مكان ممنوع';
  e.violationAddress = 'خانيونس - البلد - شارع شبير';
  e.violationPayedBy = ManagerStrings.jawwalPay;
  e.driverId = 5;
  e.policeId = 12345678;
  await violationsDatabase.create(e);
  ViolationModel ee = ViolationModel();
  ee.violationDate = '17/9/2024';
  ee.violationTime = '2:49:30 PM';
  ee.priceOfViolation = 250;
  ee.violationState = 1;
  ee.violationReason = 'عدم وضع حزام الأمان';
  ee.violationAddress = 'خانيونس - دوار بني سهيلا';
  ee.driverId = 5;
  ee.policeId = 12345678;
  await violationsDatabase.create(ee);
}
