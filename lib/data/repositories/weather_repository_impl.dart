import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/models/weather_model.dart';

import '../services/weather_service.dart';

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
  Future<List<WeatherModel>> getForecast3Hour(WeatherModel weatherModel) async {
    // TODO: implement getForecast3Hour

    try {
      List<WeatherModel> list = [];
      var response = await service.fetchForecast3Hour(
        lat: weatherModel.coordinates!.lat,
        long: weatherModel.coordinates!.long,
        units: weatherModel.unit.name,
        cnt: 40, // 40 for 5 day, 24 /3 = 8/day
      );
      if(response['list'] != null && response['list'] != []){
        response['list'].forEach((value){
          WeatherModel item = WeatherModel.fromJson(value);

          list.add(item);
          // print(item['main']);
          // print(item['dt']);
        });
      }
      return list;
    } catch (exception) {
      rethrow;
    }
  }
}
