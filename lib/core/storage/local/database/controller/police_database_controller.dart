import '/config/all_imports.dart';

class PoliceDatabaseController extends DatabaseOperations {
  final Database _database = DatabaseProvider().database;

  Future<bool> login(String jobNumber, String password) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.policeTableName,
      where:
          '${DatabaseConstants.policeJobNumber} = ?  AND ${DatabaseConstants.policePassword} = ?',
      whereArgs: [jobNumber, password],
    );
    if (rows.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<int> create(object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.policeTableName,
      object.toMap(),
    );
    return newRowId;
  }

  Future<bool> changePassword(String newPassword, int policeId) async {
    int countOfUpdatedRows = await _database.update(
      DatabaseConstants.policeTableName,
      {DatabaseConstants.policePassword: newPassword},
      where: '${DatabaseConstants.policeId} = ?',
      whereArgs: [policeId],
    );
    return countOfUpdatedRows == 1;
  }
  Future<PoliceModel?> police(int id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.policeTableName,
      where: '${DatabaseConstants.policeId} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return PoliceModel.fromMap(rows.first);
    }
    return null;
  }

  @override
  Future<PoliceModel?> show(String jobNumber) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.policeTableName,
      where: '${DatabaseConstants.policeJobNumber} = ?',
      whereArgs: [jobNumber],
    );
    if (rows.isNotEmpty) {
      return PoliceModel.fromMap(rows.first);
    }
    return null;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List> read([int? id]) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
