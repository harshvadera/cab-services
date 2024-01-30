import 'package:hive/hive.dart';
import 'package:ride_evee/features/dashboard/models/city_model.dart';

class CityLocalDataSource {
  final String boxName = "cities";

  Future<List<CityModel>> getCities() async {
    final box = await Hive.openBox<CityModel>(boxName);
    return box.values.toList();
  }
}
