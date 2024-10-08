import '/config/all_imports.dart';

class ComplaintDatabaseController extends DatabaseOperations<ComplaintModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(ComplaintModel object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.complaintsTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<List<ComplaintModel>> read([int? id]) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.complaintsTableName,
    );
    return rows.map((row) => ComplaintModel.fromMap(row)).toList();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ComplaintModel?> show(String id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(ComplaintModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
