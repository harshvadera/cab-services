import '../models/city_model.dart';
import '../repository/city_repsitory.dart';

class GetCities {
  final CityRepository repository;

  GetCities({required this.repository});

  Future<List<CityModel>> call() async {
    return repository.getCities();
  }
}
