import '/config/all_imports.dart';

class DriverDatabaseController extends DatabaseOperations<DriverModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(DriverModel object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.driverTableName,
      object.toMap(),
    );
    return newRowId;
  }

  Future<bool> login(String licenseNumber, String password) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.driverTableName,
      where:
          '${DatabaseConstants.licenseNumber} = ?  AND ${DatabaseConstants.driverPassword} = ?',
      whereArgs: [licenseNumber, password],
    );
    if (rows.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<DriverModel?> driver(int id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.driverTableName,
      where: '${DatabaseConstants.driverId} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return DriverModel.fromMap(rows.first);
    }
    return null;
  }

  Future<DriverModel?> getDriver(String licenseNumber) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.driverTableName,
      where: '${DatabaseConstants.licenseNumber} = ?',
      whereArgs: [licenseNumber],
    );
    if (rows.isNotEmpty) {
      return DriverModel.fromMap(rows.first);
    }
    return null;
  }

  Future<bool> changePassword(String newPassword, int driverId) async {
    int countOfUpdatedRows = await _database.update(
      DatabaseConstants.driverTableName,
      {DatabaseConstants.driverPassword: newPassword},
      where: '${DatabaseConstants.driverId} = ?',
      whereArgs: [driverId],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<DriverModel>> read([int? id]) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<DriverModel?> show(String id) async {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(DriverModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
