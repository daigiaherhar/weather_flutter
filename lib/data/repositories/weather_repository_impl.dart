import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/models/weather_model.dart';

import '../services/weather_service.dart';
import 'package:intl/intl.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService service;

  WeatherRepositoryImpl({required this.service});

  @override
  Future<WeatherModel> getCurrentWeather(WeatherModel weatherModel) async {
    try {
      var response = await service.fetchCurrentWeather(
        lat: weatherModel.coordinates!.lat,
        long: weatherModel.coordinates!.long,
        unit: weatherModel.unit.name,
      );

      return WeatherModel.fromJson(response);
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<String> getLocalName(WeatherModel weatherModel) async {
    // TODO: implement getLocalName
    try {
      String name = "";
      var response = await service.fetchNameLatLong(
        lat: weatherModel.coordinates!.lat,
        long: weatherModel.coordinates!.long,
      );
      name = response['local_names']['en'];
      return name;
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Future<Map<String, List<WeatherModel>>> getForecast3Hour(
    WeatherModel weatherModel,
  ) async {
    // TODO: implement getForecast3Hour

    try {
      Map<String, List<WeatherModel>> data = {};

      var response = await service.fetchForecast3Hour(
        lat: weatherModel.coordinates!.lat,
        long: weatherModel.coordinates!.long,
        units: weatherModel.unit.name,
        cnt: 40, // 40 for 5 day, 24 /3 = 8/day
      );
      if (response['list'] != null && response['list'] != []) {
        response['list'].forEach((value) {
          WeatherModel item = WeatherModel.fromJsonForecast(
            value,
            response['city'],
          );
          DateTime date = DateTime.fromMillisecondsSinceEpoch(
            item.timestamp * 1000,
          );

          String nameWeekDay = DateFormat.EEEE().format(date);
          //check weekday
          if (data.containsKey(date.weekday.toString())) {
            data[date.weekday.toString()]?.add(item);
          } else {
            data.addAll({
              date.weekday.toString(): [item],
            });
          }
        });
        print("datadatadatadata");
        print(data);
      }
      return data;
    } catch (exception) {
      rethrow;
    }
  }
}
