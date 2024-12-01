import '/config/all_imports.dart';

abstract class RemoteListOfViolationsForPoliceDataSource {
  Future<ListOfViolationsForPoliceResponse> getListOfViolationsForPolice(
      ListOfViolationsForPoliceRequest request);
}

class RemoteListOfViolationsForPoliceDataSourceImpl
    extends RemoteListOfViolationsForPoliceDataSource {
  final AppApi _appApi;

  RemoteListOfViolationsForPoliceDataSourceImpl(this._appApi);

  @override
  Future<ListOfViolationsForPoliceResponse> getListOfViolationsForPolice(
      request) async {
    return await _appApi.getListOfViolationsForPolice(request.policeManId);
  }
}
