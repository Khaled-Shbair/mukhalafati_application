import '/config/all_imports.dart';

abstract class RemoteListOfReasonsOfViolationsDataSource {
  Future<ListOfReasonsOfViolationsResponse> listOfReasonsOfViolations();
}

class RemoteListOfReasonsOfViolationsDataSourceImpl
    extends RemoteListOfReasonsOfViolationsDataSource {
  final AppApi _appApi;

  RemoteListOfReasonsOfViolationsDataSourceImpl(this._appApi);

  @override
  Future<ListOfReasonsOfViolationsResponse> listOfReasonsOfViolations() async {
    return await _appApi.listOfReasonsOfViolations();
  }
}
