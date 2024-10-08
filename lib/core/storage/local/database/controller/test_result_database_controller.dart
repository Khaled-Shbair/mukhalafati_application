import '/config/all_imports.dart';

class TestResultDatabaseController extends DatabaseOperations<TestResultModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(TestResultModel object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.testResultTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<TestResultModel?> show(String id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.testResultTableName,
      where: '${DatabaseConstants.studentId} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return TestResultModel.fromMap(rows.first);
    }
    return null;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<TestResultModel>> read([int? id]) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(TestResultModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
