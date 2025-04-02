import '../models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeather(WeatherModel weatherModel);
}