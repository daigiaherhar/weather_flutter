import 'package:intl/intl.dart';

enum UnitWeather { metric, standard, imperial }

class WeatherModel {
  int? id;
  String? nameCity;
  double temp;
  CoordinatesModel? coordinates;
  UnitWeather unit;
  int timestamp;
  String? nameWeekDay;

  WeatherModel({
    this.id,
    this.nameCity,
    this.temp = 0,
    this.timestamp = 0,
    this.coordinates,
    this.nameWeekDay,
    this.unit = UnitWeather.metric,
  }) {
    coordinates ??= CoordinatesModel();
  }

  String nameTemp() {
    if (unit == UnitWeather.metric) {
      return '${temp.round().toString()}°';
    }
    return '${temp.round().toString()}°';
  }

  String nameTempC() {
    if (unit == UnitWeather.metric) {
      return '${temp.round().toString()} C';
    }
    return '${temp.round().toString()} C';
  }

  WeatherModel.fromJson(Map<String, dynamic> json)
    : id = json["id"] ?? 0,
      nameCity = json["name"] ?? "",
      timestamp = json["dt"] ?? "",
      temp = json['main']["temp"] ?? 0.0,
      coordinates = CoordinatesModel.fromJson(json),
      unit = UnitWeather.metric;

  factory WeatherModel.fromJsonForecast(
    Map<String, dynamic> json,
    Map<String, dynamic> info,
  ) {
    String nameWeekDay = "";
    if (json["dt"] != null && json["dt"] != "") {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000);
      DateTime now = DateTime.now();
      if (date.weekday == now.weekday) {
        nameWeekDay = "Today";
      } else {
        nameWeekDay = DateFormat.EEEE().format(date);
      }
    }

    return WeatherModel(
      id: info["id"] ?? 0,
      nameCity: info["name"] ?? "",
      timestamp: json["dt"] ?? "",
      temp: json['main']["temp"] ?? 0,
      coordinates: CoordinatesModel.fromJson(info),
      unit: UnitWeather.metric,
      nameWeekDay: nameWeekDay,
    );
  }

  // static String convertWeekDay(int timestamp) {
  //   DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  //   String nameWeekDay = DateFormat.EEEE().format(date);
  //   return nameWeekDay;
  // }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': nameCity, 'temp': temp};
  }

  @override
  String toString() {
    return 'WeatherModel{id: $id, name: $nameCity, temp: $temp, coordinates: $coordinates, unit: $unit, timestamp: $timestamp}';
  }
}

class CoordinatesModel {
  double lat;
  double long;

  CoordinatesModel({this.lat = 0, this.long = 0});

  CoordinatesModel.fromJson(Map<String, dynamic> json)
    : lat = json['coord']["lat"] ?? 0.0,
      long = json['coord']['lon'] ?? 0.0;

  @override
  String toString() {
    return 'CoordinatesModel{lat: $lat, long: $long}';
  }
}
