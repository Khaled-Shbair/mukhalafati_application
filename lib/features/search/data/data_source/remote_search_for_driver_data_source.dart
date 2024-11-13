import 'package:mukhalafati_application/features/search/data/request/search_for_driver_request.dart';

import '/config/all_imports.dart';

abstract class RemoteSearchForDriverDataSource {
  Future<SearchForDriverResponse> searchForDriver(
      SearchForDriverRequest request);
}

class RemoteSearchForDriverDataSourceImpl
    extends RemoteSearchForDriverDataSource {
  final AppApi _appApi;

  RemoteSearchForDriverDataSourceImpl(this._appApi);

  @override
  Future<SearchForDriverResponse> searchForDriver(
      SearchForDriverRequest request) async {
    return await _appApi.searchForDriver(
      request.licenseNumber,
    );
  }
}
