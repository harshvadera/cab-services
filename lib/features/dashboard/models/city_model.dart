import 'package:hive/hive.dart';

part 'city_model.g.dart';

void addCitiesToHive() async {
  var citiesBox = await Hive.openBox<CityModel>('cities');
// Clear existing data
  await citiesBox.clear();

  var cities = [
    CityModel(id: 1, name: 'New York'),
    CityModel(id: 2, name: 'Los Angeles'),
    // Add more cities as needed
  ];

  for (var city in cities) {
    await citiesBox.add(city);
  }
}

@HiveType(typeId: 0)
class CityModel {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;

  CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
