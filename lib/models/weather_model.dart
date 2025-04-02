enum UnitWeather { metric, standard, imperial }

class WeatherModel {
  int? id;
  String? name;
  double temp;
  CoordinatesModel? coordinates;
  UnitWeather unit;

  WeatherModel({
    this.id,
    this.name,
    this.temp = 0,
    this.coordinates,
    this.unit = UnitWeather.metric,
  }) {
    coordinates ??= CoordinatesModel();
  }
  String nameTemp(){
    if(unit == UnitWeather.metric){
      return '${temp.round().toString()}°';
    }
    return '${temp.round().toString()}°';
  }
  WeatherModel.fromJson(Map<String, dynamic> json)
    : id = json["id"]??0,
      name = json["name"] ?? "",
      temp = json['main']["temp"] ?? 0,
      coordinates = CoordinatesModel.fromJson(json),
      unit = UnitWeather.metric;

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'temp': temp};
  }

  Map<String, dynamic> toMapParameterCurrent() {
    return {
      'lat': coordinates!.lat,
      'lon': coordinates!.long,
      'units': unit.name,
    };
  }

  @override
  String toString() {
    return 'WeatherModel{id: $id, name: $name, temp: $temp, coordinates: $coordinates, unit: $unit}';
  }
}

class CoordinatesModel {
  double lat;
  double long;

  CoordinatesModel({this.lat = 0, this.long = 0});

  CoordinatesModel.fromJson(Map<String, dynamic> json)
    : lat = json['coord']["lat"],
      long = json['coord']['lon'];

  @override
  String toString() {
    return 'CoordinatesModel{lat: $lat, long: $long}';
  }
}
