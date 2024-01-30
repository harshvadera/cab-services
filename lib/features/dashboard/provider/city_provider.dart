import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_evee/features/dashboard/models/city_model.dart';

import '../data_sources/local/city_local_datasource.dart';
import '../repository/city_repsitory.dart';
import '../usecases/get_cities.dart';

final citiesProvider = FutureProvider<List<CityModel>>((ref) async {
  final getCities = ref.watch(getCitiesUseCaseProvider);
  return await getCities();
});

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepository(
    localDataSource: CityLocalDataSource(),
  );
});

final getCitiesUseCaseProvider = Provider<GetCities>((ref) {
  final repository = ref.watch(cityRepositoryProvider);
  return GetCities(repository: repository);
});
