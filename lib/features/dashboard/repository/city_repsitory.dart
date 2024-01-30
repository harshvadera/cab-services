import 'package:ride_evee/features/dashboard/models/city_model.dart';

import '../data_sources/local/city_local_datasource.dart';

class CityRepository {
  final CityLocalDataSource localDataSource;

  CityRepository({required this.localDataSource});

  Future<List<CityModel>> getCities() async {
    return localDataSource.getCities();
  }
}
