import '/config/all_imports.dart';

class ViolationsDatabaseController extends DatabaseOperations<ViolationModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(ViolationModel object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.violationsTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<List<ViolationModel>> read([int? id]) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.violationsTableName,
    );
    return rows.map((row) => ViolationModel.fromMap(row)).toList();
  }

  @override
  Future<ViolationModel?> show(String id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.violationsTableName,
      where: '${DatabaseConstants.violationId} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return ViolationModel.fromMap(rows.first);
    }
    return null;
  }

  Future<int> numberOfViolationsUnPaid(int driverId) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.violationsTableName,
      where:
          '${DatabaseConstants.driverId} = ? AND ${DatabaseConstants.violationState} = ?',
      whereArgs: [driverId, 0],
    );
    if (rows.isNotEmpty) {
      return rows.length;
    }
    return 0;
  }
  Future<int> numberOfViolationsPaid(int driverId) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.violationsTableName,
      where:
      '${DatabaseConstants.driverId} = ? AND ${DatabaseConstants.violationState} = ?',
      whereArgs: [driverId, 1],
    );
    if (rows.isNotEmpty) {
      return rows.length;
    }
    return 0;
  }
  Future<int> totalViolationsOfPolice(int policeId) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.violationsTableName,
      where:
      '${DatabaseConstants.policeId} = ?',
      whereArgs: [policeId],
    );
    if (rows.isNotEmpty) {
      return rows.length;
    }
    return 0;
  }

  Future<bool> paymentViolation(
      int payed, String payedBy, int violationId) async {
    int countOfUpdatedRows = await _database.update(
      DatabaseConstants.violationsTableName,
      {
        DatabaseConstants.violationState: payed,
        DatabaseConstants.violationPayedBy: payedBy
      },
      where: '${DatabaseConstants.violationId} = ?',
      whereArgs: [violationId],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> update(ViolationModel object) async {
    int countOfUpdatedRows = await _database.update(
      DatabaseConstants.violationsTableName,
      object.toMap(),
      where: '${DatabaseConstants.violationId} = ?',
      whereArgs: [object.violationId],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
