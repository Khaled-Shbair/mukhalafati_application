import '/config/all_imports.dart';

class NotificationsDatabaseController
    extends DatabaseOperations<NotificationModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(NotificationModel object) async {
    int newRowId = await _database.insert(
      DatabaseConstants.notificationsTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await _database.delete(
      DatabaseConstants.notificationsTableName,
      where: '${DatabaseConstants.notificationId} = ?',
      whereArgs: [id],
    );
    return countOfDeletedRows == 1;
  }

  Future<bool> clear() async {
    int countOfDeletedRows = await _database.delete(
      DatabaseConstants.notificationsTableName,
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<NotificationModel>> read([int? id]) async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.notificationsTableName,
    );
    return rows.map((row) => NotificationModel.fromMap(row)).toList();
  }

  @override
  Future<int> numberOfNotifications() async {
    List<Map<String, dynamic>> rows = await _database.query(
      DatabaseConstants.notificationsTableName,
    );
    return rows.length;
  }

  @override
  Future<NotificationModel> show(String id) {
    // TODO: implement show
    throw UnimplementedError();
  }

  @override
  Future<bool> update(object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
