import '/config/all_imports.dart';
import 'dart:io';

/*
   * Singleton design patten : user to take only one object from this class.
   * Implement Singleton design patten:-
   *  1- make constructor private, to prevent create object.
   *  2- create instance (object) from this class inside class and make private.
   *  3- create factory constructor to return this instance.
   * Factory constructor: constructor use to return value.
   */
class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider _instance = DatabaseProvider._();

  factory DatabaseProvider() {
    return _instance;
  }

  static late Database _database;

  Database get database => _database;

  static Future<void> initDatabase() async {
    // get place of application in mobile
    Directory directory = await getApplicationDocumentsDirectory();
    // Combine of application location with name database
    String path = join(directory.path, DatabaseConstants.databaseName);
    _database = await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.driverTableName}(
            ${DatabaseConstants.driverId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.driverImage} TEXT NOT NULL,
            ${DatabaseConstants.driverFirstNameEn} TEXT NOT NULL,
            ${DatabaseConstants.driverFirstNameAr} TEXT NOT NULL,
            ${DatabaseConstants.driverLastNameEn} TEXT NOT NULL,
            ${DatabaseConstants.driverLastNameAr} TEXT NOT NULL,
            ${DatabaseConstants.driverFatherNameAr} TEXT NOT NULL,
            ${DatabaseConstants.driverFatherNameEn} TEXT NOT NULL,
            ${DatabaseConstants.driverGrandFatherNameAr} TEXT NOT NULL,
            ${DatabaseConstants.driverGrandFatherNameEn} TEXT NOT NULL,
            ${DatabaseConstants.driverNameEn} TEXT NOT NULL,
            ${DatabaseConstants.phone} TEXT NOT NULL,
            ${DatabaseConstants.licenseNumber} INTEGER NOT NULL,
            ${DatabaseConstants.releaseDate} TEXT NOT NULL,
            ${DatabaseConstants.expiryDate} TEXT NOT NULL,
            ${DatabaseConstants.licenseLevels} TEXT NOT NULL,
            ${DatabaseConstants.driverPassword} TEXT NOT NULL,
            ${DatabaseConstants.driverIdNumber} TEXT NOT NULL,
            ${DatabaseConstants.numberOfViolationsUnPaid} INTEGER NOT NULL,
            ${DatabaseConstants.numberOfUnReadNotifications} INTEGER NOT NULL
        )''');
        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.policeTableName}(
            ${DatabaseConstants.policeId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.policeFirstNameAr} TEXT NOT NULL,
            ${DatabaseConstants.policeLastNameAr} TEXT NOT NULL,
            ${DatabaseConstants.policeFatherNameAr} TEXT NOT NULL,
            ${DatabaseConstants.policeGrandfatherNameAr} TEXT NOT NULL,
            ${DatabaseConstants.policeImage} TEXT NOT NULL,
            ${DatabaseConstants.policePassword} TEXT NOT NULL,
            ${DatabaseConstants.policeJobNumber} TEXT NOT NULL,
            ${DatabaseConstants.policePhoneNumber} TEXT NOT NULL,
            ${DatabaseConstants.policeMilitaryRank} TEXT NOT NULL
        )''');
        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.complaintsTableName}(
            ${DatabaseConstants.complaintId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.complaintName} TEXT NOT NULL,
            ${DatabaseConstants.addressOfComplaint} TEXT NOT NULL,
            ${DatabaseConstants.detailOfComplaint} TEXT NOT NULL,
            ${DatabaseConstants.dateOfIncidentOrProblem} TEXT NOT NULL,
            ${DatabaseConstants.stateOfComplaint} INTEGER NOT NULL,
            FOREIGN KEY (${DatabaseConstants.complaintId}) REFERENCES ${DatabaseConstants.driverTableName} (${DatabaseConstants.driverId})
        )''');

        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.testResultTableName}(
            ${DatabaseConstants.testID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.studentName} TEXT NOT NULL,
            ${DatabaseConstants.studentId} TEXT NOT NULL,
            ${DatabaseConstants.licenseTestResults} INTEGER NOT NULL,
            ${DatabaseConstants.practicalTestResults} INTEGER NOT NULL
        )''');

        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.violationsTableName}(
            ${DatabaseConstants.violationId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.violationDate} TEXT NOT NULL,
            ${DatabaseConstants.violationTime} TEXT NOT NULL,
            ${DatabaseConstants.priceOfViolation} INTEGER NOT NULL,
            ${DatabaseConstants.violationState} INTEGER NOT NULL,
            ${DatabaseConstants.violationReason} TEXT NOT NULL,
            ${DatabaseConstants.violationAddress} TEXT NOT NULL,
            ${DatabaseConstants.violationPayedBy} TEXT,
            FOREIGN KEY (${DatabaseConstants.violationId}) REFERENCES ${DatabaseConstants.policeTableName} (${DatabaseConstants.policeId}),
            FOREIGN KEY (${DatabaseConstants.violationId}) REFERENCES ${DatabaseConstants.driverTableName} (${DatabaseConstants.driverId})
        )''');

        await db.execute('''
        CREATE TABLE  ${DatabaseConstants.notificationsTableName}(
            ${DatabaseConstants.notificationId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DatabaseConstants.notificationText} TEXT NOT NULL,
            ${DatabaseConstants.notificationTime} TEXT NOT NULL,
            FOREIGN KEY (${DatabaseConstants.notificationId}) REFERENCES ${DatabaseConstants.driverTableName} (${DatabaseConstants.driverId})
        )''');
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}
