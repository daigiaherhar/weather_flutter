import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio httpClient = Dio();

  final String baseUrl = dotenv.get("URL_WEATHER");
  final String apiKey = dotenv.get("API_KEY");
  final String currentWeather = dotenv.get('ENDPOINT_WEATHER');

  @override
  Future<WeatherModel> getCurrentWeather(WeatherModel weatherModel) async {
    try {
      Map<String, dynamic> parameter = {"appid": apiKey};
      parameter.addAll(weatherModel.toMapParameterCurrent());
      print('123123123123123');
      print('$baseUrl$currentWeather?');
      print('$parameter');
      var response = await httpClient.get(
        '$baseUrl$currentWeather',
        queryParameters: parameter,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      print("200200200200");
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.data);
        return WeatherModel.fromJson(response.data);
      }
      throw "error";
    } catch (exception) {
      throw "error22";
    }
  }
}
