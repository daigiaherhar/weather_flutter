import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/data/services/weather_service.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServiceImpl implements WeatherService {
  final Dio httpClient = Dio();
  final String baseUrl = dotenv.get("URL_WEATHER");
  final String apiKey = dotenv.get("API_KEY");
  final String currentWeather = dotenv.get('ENDPOINT_WEATHER');
  final String geoLocation = dotenv.get('ENDPOINT_GEO');
  final String forecast = dotenv.get('ENDPOINT_FORECAST');

  @override
  Future<Map<String, dynamic>> fetchCurrentWeather({
    required double lat,
    required double long,
    String? unit,
  }) async {
    try {
      Map<String, dynamic> parameter = {
        "appid": apiKey,
        'lat': lat,
        'lon': long,
        'units': unit,
      };

      var response = await httpClient.get(
        '$baseUrl$currentWeather',
        queryParameters: parameter,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      throw "error fetchCurrentWeather${response.statusCode}";
    } catch (exception) {
      throw "WeatherService - fetchCurrentWeather";
    }
  }

  @override
  Future<Map<String, dynamic>> fetchNameLatLong({
    required double lat,
    required double long,
  }) async {
    try {
      Map<String, dynamic> parameter = {
        "appid": apiKey,
        'lat': lat,
        'lon': long,
      };

      var response = await httpClient.get(
        '$baseUrl$geoLocation',
        queryParameters: parameter,
      );

      if (response.statusCode == 200) {
        return response.data[0];
      }
      throw "error fetchNameLatLong${response.statusCode}";
    } catch (exception) {
      throw "WeatherService - fetchNameLatLong";
    }
  }

  @override
  Future<Map<String, dynamic>> fetchForecast3Hour({
    required double lat,
    required double long,
    String? units,
    int? cnt,
  }) async {
    try {
      Map<String, dynamic> parameter = {
        "appid": apiKey,
        'lat': lat,
        'lon': long,
        'units': units,
        'cnt': cnt,
      };

      var response = await httpClient.get(
        '$baseUrl$forecast',
        queryParameters: parameter,
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      throw "error fetchForecast3Hour${response.statusCode}";
    } catch (exception) {
      throw "WeatherService - fetchForecast3Hour";
    }
  }
}
